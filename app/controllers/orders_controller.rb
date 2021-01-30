class OrdersController < ApplicationController
  
  def index
    @orders = Order.new
  end

  def create

    @order = UserOrder.new(order_params)

    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render action: :new
    end
  end
end
