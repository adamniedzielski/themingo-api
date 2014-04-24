class RemoveUnnecessaryFieldsFromWeeklyTheme < ActiveRecord::Migration
  def change
    remove_column :weekly_themes, :user_id, :integer
    remove_column :weekly_themes, :theme_group, :string
  end
end
