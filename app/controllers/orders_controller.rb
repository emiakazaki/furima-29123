class OrdersController < ApplicationController
  
  def index
    @order = UserOrder.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
  
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality,
    :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
