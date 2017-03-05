class User < ApplicationRecord

has_secure_password
has_secure_token

acts_as_followable
acts_as_follower

has_many :posts

validates :username, :first_name, :last_name, presence: true
validates :username, uniqueness: true

  def avatar
    image.blank? ? "https://github.com/RagenS9/chirp/commit/3969a24a79e0fda25b3dd3ceaf71f4edc3a2af78#diff-ce4218f18ff906974daacb1e5f091161" : image
  end

end
