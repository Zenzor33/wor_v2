class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_chair
   
  def create 
    @chair.favorites.create!(user: current_user)
    
    redirect_to @chair
  end 

  def destroy
    favorite = current_user.favorites.find_by(chair_id: params[:chair_id])
    favorite.destroy
    redirect_to @chair
  end 

private 
  def set_chair
    @chair = Chair.find(params[:chair_id])
  end
end
