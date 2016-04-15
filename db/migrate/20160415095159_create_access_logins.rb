class CreateAccessLogins < ActiveRecord::Migration
  def change
    create_table :access_logins do |t|
      t.references :user, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
