class HelpRequestsController < ApplicationController
  def new
    @help_request = HelpRequest.new
    @help_request.security_number = HelpRequest.generate_security_number
  end

  def show
    @help_request = HelpRequest.find(params[:id])
  end

  def edit
    @help_request = HelpRequest.find(params[:id])
    if @help_request.is_owner?(cookies[:creator_uuid])
      render :edit
    else
      redirect_to help_request_confirm_security_number_path(id: @help_request.id)
    end
  end

  def update
    @help_request = HelpRequest.find(params[:id])
    if @help_request.update(help_request_params_update)
      redirect_to @help_request
    else
      render :edit
    end
  end

  def create
    @help_request = HelpRequest.new(help_request_params_create)
    @help_request.creator_uuid = SecureRandom.uuid

    if @help_request.valid? && @help_request.save
      set_creator_uuid_cookie(@help_request)
      flash.notice = "Your Help request has been created!"
      redirect_to @help_request
    else
      flash.alert = "Please, fill all the fields."
      render :new
    end
  end

  def ask_security_number
  end

  def confirm_security_number
    @help_request = HelpRequest.find(params[:id])
    if @help_request.validate_security_number(security_number_params[:security_number])
      set_creator_uuid_cookie(@help_request)
      redirect_to edit_help_request_path(id: @help_request.id)
    else
      flash.alert = "wrong security number"
      render :ask_security_number
    end
  end

  private

  def set_creator_uuid_cookie(help_request)
    cookies[:creator_uuid] = { value: @help_request.creator_uuid, expires: 1.month }
  end

  def help_request_params_create
    params.require(:help_request).permit(:name, :address, :description, :address_lon, :address_lat, :security_number, conditions: [])
  end

  def help_request_params_update
    params.require(:help_request).permit(:name, :address, :description, :address_lon, :address_lat, conditions: [])
  end

  def security_number_params
    params.permit(:security_number)
  end
end
