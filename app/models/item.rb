class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  


  has_one :order
  belongs_to :user
  belongs_to :scheduled_delivery
  belongs_to :fee
  belongs_to :state
  belongs_to :category
  belongs_to :prefecture

  with_options presence: true do
  #空の投稿を保存できないようにする(わかりやすいように記入しています)
  validates :product_name, :text, :price,:image, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする(わかりやすいように記入しています)
  validates :scheduled_delivery_id, numericality: { other_than: 0 }
  validates :fee_id, numericality: { other_than: 0 }
  validates :state_id, numericality: { other_than: 0 }
  validates :category_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  end
  validates :price, format: { with: /\A[a-z0-9]+\z/i, message: "には半角数字のみ入力してください。"} 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"} 
end