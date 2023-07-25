class ChairsController < ApplicationController
    def index 
      @chairs = Chair.all
    end

    def show 
      @chair = Chair.find(params[:id])
    end

    def edit 
      @chair = Chair.find(params[:id])
    end 

    def update
      @chair = Chair.find(params[:id])
      chair_params = 
				params.require(:chair).
				  permit(:name, :price, :company, :picture, :description, :available_from)
      @chair.update(chair_params)
			redirect_to @chair
    end 
end
