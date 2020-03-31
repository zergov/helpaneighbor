class HelpNowController < ApplicationController
  def show
    @email_notification_subscription = EmailNotificationSubscription.new
  end

  def subscribe
    @email_notification_subscription = EmailNotificationSubscription.new(email_notification_subscription_params)
    @email_notification_subscription.confirmation_uuid = SecureRandom.uuid

    if @email_notification_subscription.save
      flash.notice = "Success! Verify your email"
      redirect_to :help_now
    else
      flash.notice = "Error!"
      redirect_to :help_now
    end
  end

  def confirm_subscription_email
    @email_notification_subscription = EmailNotificationSubscription.find_by(confirmation_uuid: params[:uuid])
    if @email_notification_subscription && @email_notification_subscription.update(confirmed: true)
      flash.notice = "You're in! We will send you an email when someone needs help near you!"
      redirect_to :homepage
    else
      flash.alert = "Something went wrong! We could not confirm your email address."
      redirect_to :homepage
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
