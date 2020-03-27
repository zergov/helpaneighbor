class HelpRequest < ApplicationRecord
  serialize :conditions, Array

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :address_lon, presence: true
  validates :address_lat, presence: true
  validates :conditions, presence: true

  scope :within, -> (longitude, latitude, radius_km = 2) {
    where("ST_Distance(address_lonlat, 'POINT(#{longitude} #{latitude})') < #{radius_km * 1000}")
  }

  def special_conditions
    SpecialCondition.default_conditions.select do |condition|
      conditions.include?(condition.name)
    end
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
end
