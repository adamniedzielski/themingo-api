class CreateThemeGroups < ActiveRecord::Migration
  def change
    create_table :theme_groups do |t|

      t.timestamps
    end
  end
end
