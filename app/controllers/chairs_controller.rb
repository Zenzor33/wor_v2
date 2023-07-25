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
      @chair.update(chair_params)
			redirect_to @chair
    end 

    def new
      @chair = Chair.new 
    end
    
    def create 
      @chair = Chair.new(chair_params) 
      @chair.save
      redirect_to @chair
    end
end

private

def chair_params
  params.require(:chair).
   permit(:name, :price, :company, :picture, :description, :available_from)
end