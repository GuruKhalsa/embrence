class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
        t.string :first_name
        t.string :last_name
        t.string :city
        t.string :state
    	t.string :name
    	t.text :synopsis
    	t.text :story
    	t.date :birthdate
    	t.date :deathdate
    	t.string :image
    	t.integer :user_id

    	t.timestamps
    end
    add_index :heroes, [:name, :user_id]
  end
end