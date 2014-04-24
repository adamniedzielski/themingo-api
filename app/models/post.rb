class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :weekly_theme 
  validates :weekly_theme, presence: true 
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  
end
