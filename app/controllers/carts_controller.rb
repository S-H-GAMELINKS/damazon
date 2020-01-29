class CartsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_cart, only: [:edit, :update, :destroy]

  def index
    @cart = current_user.carts.get_active_cart
    if @cart.nil?
      @total = 0
    else
      @total = @cart.cart_items.sum{|p| p.item.carriage ? (p.p.price + 800) * p.quantity : p.price * p.quantity } 
    end
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
    @cart.update!(done: true)

    @total = @cart.cart_items.sum{|p| p.item.carriage ? (p.p.price + 800) * p.quantity : p.price * p.quantity }

    puts @total

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    charge = Payjp::Charge.create(
      :amount => @total.to_i,
      :card => current_user.token,
      :currency => 'jpy',
    )

    redirect_to products_path
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
