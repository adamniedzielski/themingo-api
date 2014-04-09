class CreateWeeklyThemes < ActiveRecord::Migration
  def change
    create_table :weekly_themes do |t|

      t.timestamps
    end
  end
end
