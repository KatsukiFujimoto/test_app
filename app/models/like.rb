class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true, counter_cache: :likes_count
  belongs_to :user
  validates_uniqueness_of :likable_id, scope: :user_id
end
