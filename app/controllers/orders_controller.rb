class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index]
  # 購入ページに遷移する時にログインしてなければログイン画面へ飛ばしたいか判断してくれる(必要なため残しています)
  before_action :set_item,only: [:index,:create]
  before_action :move_to_index,only: [:index,:create]
  # 購入以外(必要なため残しています)

  def index
    @order = UserOrder.new
  end
  
  def create
    @order = UserOrder.new(order_params)

    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の価格
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality,
    :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user.id or @item.order
      redirect_to root_path  
    end
  end
end
