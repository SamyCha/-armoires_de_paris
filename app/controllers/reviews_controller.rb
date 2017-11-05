class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.user = User.find(params[:user_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
