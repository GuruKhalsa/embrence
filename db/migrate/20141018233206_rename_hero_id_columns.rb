class RenameHeroIdColumns < ActiveRecord::Migration
  def change
  	rename_column :hero_images, :hero_id, :ember_id
  	rename_column :posts, :hero_id, :ember_id
  	rename_column :videos, :hero_id, :ember_id
  end
end
