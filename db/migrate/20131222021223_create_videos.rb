class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      	t.string :title
      	t.string :file
      	t.integer :user_id
      	t.integer :hero_id

      	t.timestamps
    end
    add_index :videos, [:user_id, :hero_id]
  end
end
