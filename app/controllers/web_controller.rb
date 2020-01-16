class WebController < ApplicationController
  def index
    @recently_products = Product.last(9)
  end

  def about
  end

  def contact
  end
end
