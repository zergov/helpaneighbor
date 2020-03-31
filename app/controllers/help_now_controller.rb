class HelpNowController < ApplicationController
  def show
    @email_notification_subscription = EmailNotificationSubscription.new
  end

  def subscribe
    @email_notification_subscription = EmailNotificationSubscription.new(email_notification_subscription_params)
    @email_notification_subscription.confirmation_uuid = SecureRandom.uuid

    if @email_notification_subscription.valid? && @email_notification_subscription.save
      flash.notice = I18n.t("email_subscription.flash_success_verify_email")
      redirect_to :help_now
    else
      flash.alert = I18n.t("email_subscription.flash_error_check_form")
      redirect_to :help_now
    end
  end

  def confirm_subscription_email
    @email_notification_subscription = EmailNotificationSubscription.find_by(confirmation_uuid: params[:uuid])

    if @email_notification_subscription && @email_notification_subscription.confirmed
      flash.alert = I18n.t("email_subscription.flash_email_already_confirmed")
      redirect_to :homepage
      return
    end

    if @email_notification_subscription && @email_notification_subscription.update(confirmed: true)
      flash.notice = I18n.t("email_subscription.flash_email_confirmation_success")
      redirect_to :homepage
    else
      flash.alert = I18n.t("email_subscription.flash_email_could_not_confirm")
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
