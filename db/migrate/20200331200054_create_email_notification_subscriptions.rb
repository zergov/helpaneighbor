class CreateEmailNotificationSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :email_notification_subscriptions do |t|
      t.string :email
      t.string :address_lon
      t.string :address_lat
      t.st_point :address_lonlat, geographic: true

      t.index :address_lonlat, using: :gist
      t.timestamps
    end
  end
end
