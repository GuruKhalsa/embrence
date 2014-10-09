class AddTmpDirsForUpload < ActiveRecord::Migration
  def change
  	# add_column :users, :image_tmp, :string
  	add_column :heroes, :image_tmp, :string 
  	add_column :hero_images, :image_tmp, :string
  end
end
