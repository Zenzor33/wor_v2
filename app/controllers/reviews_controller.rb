class ReviewsController < ApplicationController
  def index 
    @chair = Chair.find(params[:chair_id])
    @reviews = @chair.reviews.all
  end
end
