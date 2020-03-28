class AddCreatorUiDtoHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :creator_uuid, :string
  end
end
