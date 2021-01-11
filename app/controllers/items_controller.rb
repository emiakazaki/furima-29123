class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:get, :new, :update, :create, :destroy, :edit]

  def new
    @item = Item.new
  end

  private

  def items_params
    params.require(:item).permit(:content, :image)
  end

end
