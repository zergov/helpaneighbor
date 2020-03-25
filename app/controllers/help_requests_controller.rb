class HelpRequestsController < ApplicationController
  def new
    @help_request = HelpRequest.new
  end

  def create
  end
end
