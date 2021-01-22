class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    @items = Item.all.includes(:user).order("created_at ASC")
  end

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

  def show
    @item = Item.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:image, :prefecture_id, :state_id, :fee_id, :category_id,
      :scheduled_delivery_id, :text, :product_name, :price).merge(user_id: current_user.id)
  end

end
