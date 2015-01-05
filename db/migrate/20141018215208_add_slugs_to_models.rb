class AddSlugsToModels < ActiveRecord::Migration
  def change
  	add_column :heroes, :slug, :string
  	add_column :users, :slug, :string

  	add_index :heroes, :slug
  	add_index :users, :slug
  end
end
