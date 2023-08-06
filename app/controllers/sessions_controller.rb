class SessionsController < ApplicationController
  def new  
  end 

  def create  
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      redirect_to user, notice: "Welcome back, #{user.name}"
    else  
      flash.now[:alert] = "invalid"
      render :new, status: :unprocessable_entity
    end
  end  

  def destroy  
  end
end
