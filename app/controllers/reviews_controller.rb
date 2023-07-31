class ReviewsController < ApplicationController

  before_action :set_chair

  def index 
    @reviews = @chair.reviews.all
  end

  def new
    @review = @chair.reviews.new 
  end

  def create 
    @review = @chair.reviews.new(review_params)
    if @review.save 
      redirect_to chair_reviews_path(@chair), notice: "Review created successfully"
    else  
      flash[:alert] = @review.errors.full_messages
      redirect_to new_chair_review_path(@chair), status: :unprocessable_entity
    end
  end

  def edit
    @review = @chair.reviews.find(params[:id])
  end
end

private 

def set_chair
  @chair = Chair.find(params[:chair_id])
end

def review_params
  params.require(:review).
   permit(:name, :stars, :comment)
end