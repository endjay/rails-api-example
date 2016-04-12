class CreateArtikels < ActiveRecord::Migration
  def change
    create_table :artikels do |t|
      t.text :title
      t.text :content

      t.timestamps null: false
    end
  end
end
