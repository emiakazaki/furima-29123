class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  # ログインしてなければログイン画面へ飛ばす(必要なため残しています)
  before_action :set_item,only: [:edit,:show,:update]
  # 編集詳細では＠itemを準備(必要なため残しています)
  before_action :move_to_index, except: [:index, :new, :create]
  # 一覧詳細出品以外(必要なため残しています)

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :prefecture_id, :state_id, :fee_id, :category_id,
      :scheduled_delivery_id, :text, :product_name, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
    # 出品者以外はトップページへリダイレクト(必要なため残しています)
  end

end
