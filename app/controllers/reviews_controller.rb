class ReviewsController < ApplicationController

  before_action :require_signin
  before_action :set_chair

  def index 
    @reviews = @chair.reviews.all
  end

  def new
    @review = @chair.reviews.new 
  end

  def create 
    @review = @chair.reviews.new(review_params)
    @review.user = current_user
    if @review.save 
      redirect_to chair_reviews_path(@chair), notice: "Review created successfully"
    else  
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = @chair.reviews.find(params[:id])
  end

  def update 
    @review = @chair.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to chair_reviews_path(@chair), notice: "Review successfully updated"
    else  
      render :edit, status: :unprocessable_entity
    end 
  end 

  def destroy
    @review = @chair.reviews.find(params[:id])
    @review.destroy 

    redirect_to chair_reviews_path(@chair), notice: "Review deleted", status: :see_other
  end 
end

private 

def set_chair
  @chair = Chair.find_by!(slug: params[:id])
end

def review_params
  params.require(:review).
   permit(:name, :stars, :comment)
end
