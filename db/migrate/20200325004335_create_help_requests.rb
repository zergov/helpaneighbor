class CreateHelpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :help_requests do |t|
      t.string :name
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
