class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :name
    	t.text :post
    	t.integer :user_id
    	t.integer :hero_id

    	t.timestamps
    end
    add_index :posts, [:user_id, :hero_id]
  end
end
