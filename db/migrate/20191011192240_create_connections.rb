class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :follower_id, :null => false
      t.integer :followee_id, :null => false
      t.timestamps
    end
  end
end
