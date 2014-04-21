class ThemeGroup < ActiveRecord::Base
	has_many :weekly_themes
	has_many :users
end
