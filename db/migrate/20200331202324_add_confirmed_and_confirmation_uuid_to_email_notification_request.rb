class AddConfirmedAndConfirmationUuidToEmailNotificationRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :email_notification_subscriptions, :confirmed, :boolean, default: false
    add_column :email_notification_subscriptions, :confirmation_uuid, :string
    add_index :email_notification_subscriptions, :confirmed
  end
end
