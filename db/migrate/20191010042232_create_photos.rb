class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name, :null => false
      t.string :url, :null => false
      t.integer :user_id
      t.timestamps
    end
    add_foreign_key :photos, :users
  end
end
