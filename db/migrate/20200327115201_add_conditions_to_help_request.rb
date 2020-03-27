class AddConditionsToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :conditions, :string
  end
end
