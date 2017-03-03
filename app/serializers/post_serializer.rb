class PostSerializer < ActiveModel::Serializer
  attributes :body
  has_one :user
end
