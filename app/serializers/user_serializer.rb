class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :avatar
end
