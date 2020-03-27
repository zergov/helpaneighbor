class HelpRequest < ApplicationRecord
  serialize :conditions, Array

  scope :within, -> (longitude, latitude, radius_km = 2) {
    where("ST_Distance(address_lonlat, 'POINT(#{longitude} #{latitude})') < #{radius_km * 1000}")
  }
end
