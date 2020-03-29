class HelpRequest < ApplicationRecord
  serialize :conditions, Array

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :conditions, presence: true
  validates :security_number, presence: true, numericality: { only_integer: true }, length: { is: 6 }

  validate :validate_address_has_coordinates

  before_save :set_coordinates

  def self.generate_security_number
    SecureRandom.random_number(10**6).to_s.rjust(6, '0')
  end

  scope :within, -> (longitude, latitude, radius_km = 2) {
    where("ST_Distance(address_lonlat, 'POINT(#{longitude} #{latitude})') < #{radius_km * 1000}")
  }

  def special_conditions
    SpecialCondition.default_conditions.select do |condition|
      conditions.include?(condition.name)
    end
  end

  def pretty_security_number
    security_number.chars.each_slice(3).map(&:join).join(' ')
  end

  def is_owner?(uuid)
    creator_uuid == uuid
  end

  def validate_security_number(submitted_number)
    security_number == submitted_number
  end

  def as_json(options = {})
    {
      id: id,
      name: name,
      description: description,
      address: address,
      address_lat: address_lat,
      address_lon: address_lon,
      conditions: special_conditions,
    }
  end

  private

  def set_coordinates
    self.address_lonlat = "POINT(#{address_lon} #{address_lat})" if address_lon && address_lat
  end

  def validate_address_has_coordinates
    if address_lat.blank? || address_lon.blank?
      error = I18n.t("help_requests_new.invalid_address")
      errors.add(:address_coordinates, error)
      errors.add(:address, error)
    end
  end
end
