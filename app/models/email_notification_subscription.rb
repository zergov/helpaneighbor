class EmailNotificationSubscription < ApplicationRecord
  after_create :send_confirmation_email

  def send_confirmation_email
    UserNotifierEmailMailer.send_subscription_email_confirmation(self).deliver
  end
end
