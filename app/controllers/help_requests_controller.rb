class HelpRequestsController < ApplicationController
  def new
    @help_request = HelpRequest.new
  end

  def create
    @help_request = HelpRequest.new(help_request_params)
    redirect_to :request_help
  end

  private

  def help_request_params
    params.require(:help_request).permit(:name, :address, :description)
  end
end
