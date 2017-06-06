class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :url, length: { minimum: 3 }, presence: true
end
