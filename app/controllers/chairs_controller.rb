class ChairsController < ApplicationController
    def index 
      @chairs = Chair.all
      @available_chairs = Chair.available
    end

    def show 
      @chair = Chair.find(params[:id])
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

      redirect_to root_path, status: :see_other
    end
end

private

def chair_params
  params.require(:chair).
   permit(:name, :price, :company, :picture, :description, :available_from)
end