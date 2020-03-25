class HelpRequestsController < ApplicationController
  def new
    @help_request = HelpRequest.new
  end

  def show
    @help_request = HelpRequest.find(params[:id])
  end

  def create
    @help_request = HelpRequest.new(help_request_params)

    longitude = @help_request.address_lon
    latitude  = @help_request.address_lat
    @help_request.address_lonlat = "POINT(#{longitude} #{latitude})"

    if @help_request.save
      redirect_to @help_request
    else
      render :new
    end
  end

  private

  def help_request_params
    params.require(:help_request).permit(:name, :address, :description, :address_lon, :address_lat)
  end
end
