class AddUuidToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'
    add_column :help_requests, :uuid, :uuid, default: "uuid_generate_v4()", null: false
    add_index :help_requests, :uuid
  end
end
