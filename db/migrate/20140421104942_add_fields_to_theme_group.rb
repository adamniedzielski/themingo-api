class AddFieldsToThemeGroup < ActiveRecord::Migration
  def change
  	add_column :theme_groups, :name, :string
  	
  end
end
