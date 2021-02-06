class OrdersController < ApplicationController
  
  def index
    @order = UserOrder.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])

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

end
