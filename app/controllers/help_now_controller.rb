class HelpNowController < ApplicationController
  def show
    @email_notification_subscription = EmailNotificationSubscription.new
  end

  def subscribe
    @email_notification_subscription = EmailNotificationSubscription.new(email_notification_subscription_params)
    if @email_notification_subscription.save
      flash.notice = "Success! Verify your email"
      redirect_to :help_now
    else
      flash.notice = "Error!"
      redirect_to :help_now
    end
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

  private

  def email_notification_subscription_params
    params.require(:email_notification_subscription).permit(:email, :address_lon, :address_lat, :address)
  end
end
