class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :image

  def image
    User.avatar
  end


end
