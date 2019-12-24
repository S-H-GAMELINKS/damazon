class CartsController < ApplicationController
  before_action :set_product, only: [:create, :update]
  before_action :set_cart, only: [:edit, :destroy]

  def index
    @cart = current_user.carts.get_active_cart
  end

  def create
    if current_user.carts.empty? or current_user.carts.last.done
      @cart = current_user.carts.build
      @cart.save!
    else
      @cart = current_user.carts.last
    end
    @cart.add(@product, @product.price)
    @cart.save

    redirect_to @product
  end

  def edit
  end

  def update
  end

  def destroy
    @cart.destroy
    redirect_to carts_path
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_cart
      @cart = Cart.find(params[:id])
    end
end
