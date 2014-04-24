class ThemeGroup < ActiveRecord::Base
	has_many :weekly_themes
  has_many :memberships
	has_many :users, :through => :memberships
	validates :name, presence: true
end
