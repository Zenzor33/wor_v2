class UsersController < ApplicationController

  before_action :require_signin, except: ["new", "create"]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all 
  end 

  def show  
    @user = User.find(params[:id])
    @liked_chairs = @user.liked_chairs
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to users_path, notice: "Registration successful"
    else  
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
  end 

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Account successfully updated"
    else  
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy  
    @user.delete

    redirect_to users_path, notice: "Account deleted", status: :see_other
  end
end

private  

def require_correct_user
  @user = User.find(params[:id])
  
  redirect_to root_path, alert: "working" unless current_user?(@user)
end 

def user_params
  @user = User.find(params[:id])
  params.require(:user).
   permit(:name, :email, :password, :password_confirmation)
end