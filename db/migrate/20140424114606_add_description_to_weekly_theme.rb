class AddDescriptionToWeeklyTheme < ActiveRecord::Migration
  def change
    add_column :weekly_themes, :description, :text
  end
end
