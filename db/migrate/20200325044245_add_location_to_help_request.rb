class AddLocationToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :address_lonlat, :st_point, geographic: true
    add_column :help_requests, :address_lon, :string
    add_column :help_requests, :address_lat, :string
  end
end
