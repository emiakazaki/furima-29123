class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :scheduled_delivery
  belongs_to :fee
  belongs_to :state
  belongs_to :category
  belongs_to :prefecture
  has_one_attached :image
  has_one :order
  belongs_to :user
  
  with_options presence: true do
    #空の投稿を保存できないようにする(わかりやすいように記入しています)
    validates :product_name, :text, :image
    #ジャンルの選択が「--」の時は保存できないようにする(わかりやすいように記入しています)
    with_options numericality: { other_than: 0 } do
      validates :scheduled_delivery_id
      validates :fee_id
      validates :state_id
      validates :category_id
      validates :prefecture_id
    end
  end
  validates :price, format: { with: /\A[a-z0-9]+\z/i, message: "には半角数字のみ入力してください。"} 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"} 
end