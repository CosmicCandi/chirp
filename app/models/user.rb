class User < ApplicationRecord

has_secure_password
has_secure_token

validates :username, :first_name, :last_name, presence: true
validates :username, uniqueness: true

  def avatar
    image.blank? ? "http://www.example.org/images/image.jpg" : image
  end

end
