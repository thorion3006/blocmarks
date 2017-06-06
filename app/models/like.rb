class Like < ApplicationRecord
  belongs_to :user
  belongs_to :bookmark

  validates :user_id, presence: true
  validates :bookmark_id, presence: true
end
