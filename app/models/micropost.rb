class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_rich_text :rich_content

  validates :content, presence: true
  validates :user_id, presence: true
end
