class ReviewsController < ApplicationController

  before_action :set_chair

  def index 
    @reviews = @chair.reviews.all
  end

  def new
    @review = @chair.reviews.new 
  end
end

private 

def set_chair
  @chair = Chair.find(params[:chair_id])
end
