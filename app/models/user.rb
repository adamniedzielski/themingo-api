class User < ActiveRecord::Base
  acts_as_token_authenticatable
  has_many :posts
  has_many :theme_groups, :through => :memberships
  has_many :memberships

  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def friend?(user)
    (theme_groups & user.theme_groups).any?
  end  
end
