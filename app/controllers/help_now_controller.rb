class HelpNowController < ApplicationController
  def show
    @email_notification_subscription = EmailNotificationSubscription.new
  end

  def search
    if params.key?(:lat) && params.key?(:lng)
      @help_requests = HelpRequest.within(params[:lng], params[:lat])
    else
      @help_requests = []
    end

    respond_to do |format|
      format.json { render json: @help_requests }
    end
  end
end
