class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :history

  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: { minimum: 3 }, presence: true

  def should_generate_new_friendly_id?
    title_changed?
  end
end
