class HelpRequestsController < ApplicationController
  def create
    help_request = HelpRequest.new(help_request_params)
    if help_request.save
      render json: help_request, status: :created
    else
      render json: {error: help_request.errors}, status: :bad_request
    end
  end

  private

  def help_request_params
    params.permit(:address, :description)
  end
end
