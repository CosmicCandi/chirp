class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :user_id
  has_one :user
end
