class AddUniqueConstraintToFavoriteTable < ActiveRecord::Migration[5.2]
  def up
    add_index :favorites, [:photo_id, :user_id], unique: true
  end

  def down
    remove_index :favorites, [:photo_id, :user_id], unique: true
  end
end
