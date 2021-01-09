class ItemsController < ApplicationController
  private

  def items_params
    params.require(:item).permit(:content, :image)
  end
end
