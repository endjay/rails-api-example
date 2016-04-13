class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.string :name, limit: 30

      t.timestamps null: false
    end
    add_index :roles, :name, unique: true
  end
end
