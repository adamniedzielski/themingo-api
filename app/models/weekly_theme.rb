class WeeklyTheme < ActiveRecord::Base
	belongs_to :theme_group
	has_many :posts
	validates :name, presence: true
  validates :theme_group, presence: true
end
