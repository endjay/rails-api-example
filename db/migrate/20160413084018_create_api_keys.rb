class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token, index:true
      # t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
