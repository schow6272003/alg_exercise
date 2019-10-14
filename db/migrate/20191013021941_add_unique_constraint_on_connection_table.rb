class AddUniqueConstraintOnConnectionTable < ActiveRecord::Migration[5.2]
  def up
    add_index :connections, [:follower_id, :followee_id], unique: true
  end

  def down
    remove_index :connections, [:follower_id, :followee_id], unique: true
  end
end
