class HelpRequestsController < ApplicationController
  before_action :load_help_request, only: [:show, :edit, :update, :delete, :confirm_security_number]
  before_action :verify_ownership, only: [:edit, :update, :delete]

  def new
    @help_request = HelpRequest.new
    @help_request.security_number = HelpRequest.generate_security_number
  end

  def show
  end

  def edit
  end

  def update
    if @help_request.update(help_request_params_update)
      redirect_to @help_request
    else
      render :edit
    end
  end

  def delete
    @help_request.deleted = true
    if @help_request.save
      flash.notice = I18n.t("help_requests_edit.flash_delete_success")
      redirect_to :homepage
    else
      flash.alert = I18n.t("help_requests_edit.flash_delete_error")
      redirect_to edit_help_request_path(id: @help_request.id)
    end
  end

  def create
    @help_request = HelpRequest.new(help_request_params_create)
    @help_request.creator_uuid = SecureRandom.uuid

    if @help_request.valid? && @help_request.save
      set_creator_uuid_cookie(@help_request)
      flash.notice = I18n.t("help_requests_new.flash_created_success")
      redirect_to @help_request
    else
      flash.alert = I18n.t("help_requests_new.flash_creation_error")
      render :new
    end
  end

  def ask_security_number
  end

  def confirm_security_number
    if @help_request.validate_security_number(security_number_params[:security_number])
      set_creator_uuid_cookie(@help_request)
      redirect_to edit_help_request_path(id: @help_request.id)
    else
      flash.alert = I18n.t("help_requests_ask_security_number.flash_error")
      render :ask_security_number
    end
  end

  private

  def load_help_request
    @help_request = HelpRequest.find(params[:id])
  end

  def verify_ownership
    unless @help_request.is_owner?(cookies[:creator_uuid])
      redirect_to help_request_confirm_security_number_path(id: @help_request.id)
    end
  end

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
