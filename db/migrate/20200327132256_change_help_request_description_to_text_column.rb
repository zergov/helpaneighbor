class ChangeHelpRequestDescriptionToTextColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :help_requests, :description, :text
  end
end
