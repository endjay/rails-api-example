class AddReferencesToApiKeys < ActiveRecord::Migration
  def change
    add_reference :api_keys, :user, index: true, foreign_key: true
    add_reference :api_keys, :role, index: true, foreign_key: true
    add_reference :api_keys, :client, index: true, foreign_key: true
    add_column :api_keys, :ttl, :integer, index: true 
  end
end
