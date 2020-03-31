class EmailNotificationSubscription < ApplicationRecord
  before_save :set_coordinates

  after_create :send_confirmation_email

  def send_confirmation_email
    UserNotifierEmailMailer.send_subscription_email_confirmation(self).deliver
  end

  private

  def set_coordinates
    self.address_lonlat = "POINT(#{address_lon} #{address_lat})" if address_lon && address_lat
  end
end
