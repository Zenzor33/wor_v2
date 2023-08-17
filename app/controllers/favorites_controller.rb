class FavoritesController < ApplicationController
  before_action :require_signin
   
  def create 
    @chair = Chair.find(params[:chair_id])
    @chair.favorites.create(user: current_user)
    
    redirect_to chair_path(@chair)
  end 
end
