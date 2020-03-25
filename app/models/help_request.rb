class HelpRequest < ApplicationRecord
  scope :within, -> (longitude, latitude, radius_km = 1) {
    where("ST_Distance(address_lonlat, 'POINT(#{longitude} #{latitude})') < #{radius_km * 1000}")
  }
end
