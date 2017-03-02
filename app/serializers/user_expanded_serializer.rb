class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :avatar, :token
end
