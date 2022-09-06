class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
  has_rich_text :rich_content
  acts_as_taggable_on :tags

  enum :category, { personal: 0, food: 1, travel: 2, lifestyle: 3, technology: 4, fashion: 5, entertainment: 6 }

  validates :content, presence: true, length: { minimum: 10, maximum: 100 }
  validates :user_id, presence: true
  validates :category, presence: true
end
