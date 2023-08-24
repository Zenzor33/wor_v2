class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_chair
   
  def create 
    @chair.favorites.create!(user_id: current_user.id)
    
    redirect_to @chair
  end 

  def destroy
    favorite = @chair.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to @chair
  end 

private 
  def set_chair
    @chair = Chair.find_by!(slug: params[:chair_id])
  end
end
