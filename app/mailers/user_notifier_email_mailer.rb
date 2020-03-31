class UserNotifierEmailMailer < ApplicationMailer
  default :from => "noreply@helpaneighbor.ca"

  def send_subscription_email_confirmation(email_notification_subscription)
    @email_notification_subscription = email_notification_subscription
    mail({
      to: email_notification_subscription.email,
      subject: "helpaneighbor.ca - #{I18n.t('email_subscription.confirmation_subject')}"
    })
  end

  def send_new_help_request_near_you_notification(help_request)
    @help_request = help_request
    longitude = @help_request.address_lon
    latitude = @help_request.address_lat
    email_notifications = EmailNotificationSubscription.confirmed.within(longitude, latitude)

    mail({
      subject: "helpaneighbor.ca - Someone needs help near you!",
      bcc: email_notifications.map(&:email),
    })
  end
end
