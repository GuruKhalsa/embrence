class AddTempFileLocationToVideo < ActiveRecord::Migration
  def change
  	add_column :videos, :file_tmp, :string
  end
end
