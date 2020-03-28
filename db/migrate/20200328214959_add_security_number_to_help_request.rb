class AddSecurityNumberToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :security_number, :string
  end
end
