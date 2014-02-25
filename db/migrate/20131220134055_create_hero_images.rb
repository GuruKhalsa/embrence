class CreateHeroImages < ActiveRecord::Migration
  def change
    create_table :hero_images do |t|
    	t.string :title
    	t.string :image
    	t.integer :user_id
    	t.integer :hero_id

    	t.timestamps
    end
    add_index :hero_images, [:user_id, :hero_id]
  end
end
