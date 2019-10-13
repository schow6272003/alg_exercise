class AddReferenceToFavoritesTable < ActiveRecord::Migration[5.2]
  def up
    remove_column :favorites, :photo_id
    remove_column :favorites, :user_id
    add_reference :favorites, :photo, index: true, foreign_key: true
    add_reference :favorites, :user, index: true, foreign_key: true
    add_column  :favorites, :enable, :boolean, :default => true
  end

  def down
    remove_reference :favorites, :photo, index: true, foreign_key: true
    remove_reference :favorites, :user, index: true, foreign_key: true
    add_column :favorites, :photo_id
    add_column :favorites, :user_id
    remove_column  :favorites, :enable, :boolean, :default => true
  end 
  
end
