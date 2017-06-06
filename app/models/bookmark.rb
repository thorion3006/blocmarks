class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :url, length: { minimum: 3 }, presence: true
end
