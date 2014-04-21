class AddFieldsToWeeklyTheme < ActiveRecord::Migration
  def change
  	add_column :weekly_themes, :theme_group, :string
  	add_column :weekly_themes, :name, :string
  end
end
