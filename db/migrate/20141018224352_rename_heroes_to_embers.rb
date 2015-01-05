class RenameHeroesToEmbers < ActiveRecord::Migration
  def change
  	rename_table :heroes, :embers
  end
end
