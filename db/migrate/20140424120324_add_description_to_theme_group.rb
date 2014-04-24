class AddDescriptionToThemeGroup < ActiveRecord::Migration
  def change
    add_column :theme_groups, :description, :text
  end
end
