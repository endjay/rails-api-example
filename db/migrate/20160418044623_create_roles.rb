class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :client_id
      t.string :name
      t.string :access
      t.timestamps null: false
    end
  end
end
