class Post < ApplicationRecord

  belongs_to :user
  validates :body, presence: true, length: { maximum: 160}

  acts_as_likeable

  def self.timeline(user)
    following_ids = user.followees(User).pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
