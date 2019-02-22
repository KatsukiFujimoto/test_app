class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy
  validates :user_id, :commentable_id, :commentable_type, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
