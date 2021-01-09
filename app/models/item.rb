class Item < ApplicationRecord
  has_one_attached :image
  validates :content, presence: true
  validates :image, presence: true
  has_one :order
  belongs_to :user
  belongs_to_active_hash :fee_id 
| belongs_to_active_hash :state_id
| belongs_to_active_hash :category_id
| belongs_to_active_hash :prefecture_id
| belongs_to_active_hash :time_id   
end
