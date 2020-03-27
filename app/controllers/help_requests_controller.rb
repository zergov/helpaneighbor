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
      flash.notice = "Your Help request has been created!"
      redirect_to @help_request
    else
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

  def help_request_params
    params.require(:help_request).permit(:name, :address, :description, :address_lon, :address_lat, :security_question, :security_question_answer, conditions: [])
  end
end
