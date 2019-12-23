class ReviewsController < ApplicationController
  before_action :set_product

  def create
    @review = @product.reviews.build review_params
    @review.user_id = current_user.id
    @review.save!
    redirect_to @product
  end

  def update
  end

  def destroy
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def review_params
      params.require(:review).permit(:content, :score)
    end
end
