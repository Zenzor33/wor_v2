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
      redirect_to :new, status: :unprocessable_entity
    end
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
