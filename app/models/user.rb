class User < ActiveRecord::Base
  acts_as_token_authenticatable
  has_many :posts, through: :weekly_themes
  has_many :weekly_themes
  has_many :theme_groups
  validates :nickname, presence: true

  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
