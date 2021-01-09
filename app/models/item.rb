class Item < ApplicationRecord
  has_one_attached :image
  validates :content, presence: true
  validates :image, presence: true
  has_one :order
  belongs_to :user
end
