class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :content, presence: true
  validates :user_id, presence: true
end
