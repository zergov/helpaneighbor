class EmailNotificationSubscription < ApplicationRecord
  before_save :set_coordinates

  after_create :send_confirmation_email

  validates :email, presence: true
  validates :address, presence: true
  validates :confirmation_uuid, presence: true
  validate :validate_address_has_coordinates

  scope :confirmed, -> { where(confirmed: true) }
  scope :within, -> (longitude, latitude, radius_km = 2) {
    where("ST_Distance(address_lonlat, 'POINT(? ?)') < ?", longitude.to_f, latitude.to_f, radius_km * 1000)
  }

  def send_confirmation_email
    UserNotifierEmailMailer.send_subscription_email_confirmation(self).deliver
  end

  private

  def set_coordinates
    self.address_lonlat = "POINT(#{address_lon} #{address_lat})" if address_lon && address_lat
  end

  def validate_address_has_coordinates
    if address_lat.blank? || address_lon.blank?
      error = "no coordinates"
      errors.add(:address_coordinates, error)
      errors.add(:address, error)
    end
  end
end
