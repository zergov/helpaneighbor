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

    longitude = @help_request.address_lon
    latitude  = @help_request.address_lat
    @help_request.address_lonlat = "POINT(#{longitude} #{latitude})"

    if @help_request.save
      flash.notice = "Your Help request has been created!"
      redirect_to @help_request
    else
      flash.alert = "Please, fill all the fields."
      render :new
    end
  end

  def find
    if params.key?(:lat) && params.key?(:lng)
      @help_requests = HelpRequest.within(params[:lng], params[:lat])
    else
      @help_requests = []
    end

    respond_to do |format|
      format.json { render json: @help_requests }
    end
  end

  private

  def help_request_params_create
    params.require(:help_request).permit(:name, :address, :description, :address_lon, :address_lat, :security_number, conditions: [])
  end

  def help_request_params_update
    params.require(:help_request).permit(:name, :address, :description, :address_lon, :address_lat, conditions: [])
  end
end
