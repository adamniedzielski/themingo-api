class UserSerializer < ActiveModel::Serializer
  attributes  :id, :email, :nickname, :first_name, :last_name, :description,
              :age, :location
end
