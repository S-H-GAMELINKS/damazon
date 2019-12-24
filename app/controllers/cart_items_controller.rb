class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]

  def update
    @cart_item.update(cart_item_params)
    redirect_to carts_path
  end

  def destroy
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end
