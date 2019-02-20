class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :user_id, :commentable_id, :commentable_type, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
