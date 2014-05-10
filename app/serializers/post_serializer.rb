
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :link, :user_id
end
