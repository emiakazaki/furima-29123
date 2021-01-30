class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def create

    @order = UserOrder.new(order_params)

    if @order.valid?
      @order.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render action: :new #バリデーションを弾かれた時
    end
  end
end
