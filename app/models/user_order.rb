class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:municipality,:address,:building_name,:tel,:token
  validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, messsgge: "は「-」も入力してください"}
  validates :tel, format: { with: /\A\d{10,11}\z/, message: "にはハイフンなし半角数字のみ入力してください"} 

 #空の投稿を保存できないようにする(わかりやすいように記入しています)
  with_options presence: true do
    validates :postal_code, :municipality, :address, :tel, :item_id, :user_id, :token
  end
 #都道府県の選択が「--」の時は保存できないようにする(わかりやすいように記入しています)
  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id) 
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
    municipality: municipality, building_name: building_name,
    tel: tel, order_id: order.id)
  end
end
