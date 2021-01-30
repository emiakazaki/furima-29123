class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:municipality,:address,:building_name,:tel

  # ここにバリデーションの処理を書く
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, messsgge: "は「-」も入力してください"}
    validate :prefecture_id
    validate :municipality
    validate :address
    validates :tel, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, messsgge: "は「-」も入力してください"}
    validate :user_id
    validate :item_id

  def save
    # 各テーブルにデータを保存する処理を書く
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,municipality: municipality, building_name: building_name,
    tel: tel, order_id: order.id)
     # 購入の情報を保存
    Orders.create(user_id: user.id, item_id: item.id)
  end
end
