
class WeeklyThemeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :posts
end
