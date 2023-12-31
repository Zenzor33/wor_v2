class ChairsController < ApplicationController

  before_action :require_admin_or_verified, only: [:new, :create]
  before_action :set_chair, only: [:show, :edit, :update, :destroy]

  def index 
    # TODO: Don't use case statements in Rails
    @chairs = { 
      "available" => Chair.available, 
      "low_price_chair" => Chair.low_price_chair
    }[params[:filter]] || Chair.all
  end

  def show 
    @features = @chair.features.order(:name)
    @likers = @chair.likers 
  end

  def edit 
    
  end 

  def update
    if @chair.update(chair_params)
      flash[:notice] = "Chair successfully updated!"
      redirect_to @chair
    else  
      render :edit, status: :unprocessable_entity
    end
  end 

  def new
    @chair = Chair.new 
  end
  
  def create 
    @chair = current_user.chairs.build(chair_params) 
    if @chair.save
      flash[:notice] = "Chair successfully created!"
      redirect_to @chair
    else  
      render :new, status: :unprocessable_entity #renders :new form with all valid form data
    end
  end

  def destroy
    @chair.destroy 
    
    flash[:notice] = "Chair successfully destroyed" 
    redirect_to root_path, status: :see_other
  end

  private

  def chair_params
    params.require(:chair).permit(:name, :price, :company, :main_image, :description, :available_from, :feature_ids => [])
  end

  def set_chair
    @chair = Chair.find_by!(slug: params[:id])
  end
end



