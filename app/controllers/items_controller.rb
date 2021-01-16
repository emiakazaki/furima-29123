class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:get, :new, :update, :create, :destroy, :edit]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :prefecture_id, :state_id, :fee_id, :category_id,
      :scheduled_delivery_id, :text, :product_name, :price).merge(user_id: current_user.id)
  end

end
