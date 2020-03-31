class AddAddressToEmailNotificationSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :email_notification_subscriptions, :address, :string
  end
end
