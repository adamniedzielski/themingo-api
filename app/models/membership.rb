class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme_group

  validates :user, :presence => true
  validates :theme_group, :presence => true
end
