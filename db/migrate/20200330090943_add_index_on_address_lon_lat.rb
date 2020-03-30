class AddIndexOnAddressLonLat < ActiveRecord::Migration[6.0]
  def change
    add_index :help_requests, :address_lonlat, using: :gist
  end
end
