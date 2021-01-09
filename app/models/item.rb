class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  validates :content, presence: true
  validates :image, presence: true

  has_one :order
  belongs_to :user
  belongs_to :time_id
  belongs_to :fee_id
  belongs_to :state_id
  belongs_to :category_id
  belongs_to :prefecture_id

  #空の投稿を保存できないようにする(わかりやすいように記入しています)
  validates :product_name, :text, :price, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする(わかりやすいように記入しています)
  validates :time_id, numericality: { other_than: 1 }
  validates :fee_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "には半角数字のみ入力してください。"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end
