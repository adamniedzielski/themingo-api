class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :nickname, :string
  end
end
