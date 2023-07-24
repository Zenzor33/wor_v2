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
end
