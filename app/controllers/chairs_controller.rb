class ChairsController < ApplicationController

  before_action :require_admin, only: [:new, :create]

    def index 
      case params[:filter]
      when "available"
        @chairs = Chair.available  
      when "low_price_chair"
        @chairs = Chair.low_price_chair
      else
        @chairs = Chair.all
      end
    end

    def show 
      @chair = Chair.find(params[:id])
      @features = @chair.features.order(:name)
      @likers = @chair.likers 
    end

    def edit 
      @chair = Chair.find(params[:id])
    end 

    def update
      @chair = Chair.find(params[:id])
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
      @chair = Chair.new(chair_params) 
      if @chair.save
        flash[:notice] = "Chair successfully created!"
        redirect_to @chair
      else  
        render :new, status: :unprocessable_entity #renders :new form with all valid form data
      end
    end

    def destroy
      @chair = Chair.find(params[:id])
      @chair.destroy 
      
      flash[:notice] = "Chair successfully destroyed" 
      redirect_to root_path, status: :see_other
    end
end

private

def chair_params
  params.require(:chair).
   permit(:name, :price, :company, :picture, :description, :available_from, :feature_ids => [])
end