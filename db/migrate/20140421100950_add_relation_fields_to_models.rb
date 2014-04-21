class AddRelationFieldsToModels < ActiveRecord::Migration
  def change
  	add_column :posts, :user_id, :integer
  	add_column :posts, :weekly_theme_id, :integer
  	add_column :weekly_themes, :theme_group_id, :integer
  	add_column :weekly_themes, :user_id, :integer
  

  end
end
