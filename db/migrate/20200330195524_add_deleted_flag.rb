class AddDeletedFlag < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :deleted, :boolean, default: false
    add_index :help_requests, :deleted
  end
end
