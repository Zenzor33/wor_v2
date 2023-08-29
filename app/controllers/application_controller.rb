class ApplicationController < ActionController::Base

private
  def current_user 
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    user == current_user
  end 

  helper_method :current_user?

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def current_user_owner?(obj)
    current_user && current_user.id == obj.user_id
  end 

  helper_method :current_user_owner?

  def current_user_verified?
    current_user && current_user.verified?
  end

  helper_method :current_user_verified?

  def require_admin 
    unless current_user_admin?
      redirect_to root_path, alert: "Unauthorized access!"
    end 
  end  

  def require_signin 
    unless current_user 
      session[:intended_url] = request.url 
      redirect_to new_session_url, alert: "Please sign in!"
    end
  end 

  def require_admin_or_verified 
    unless current_user_admin? || current_user_verified?
      redirect_to root_path, alert: "Unauthorized access!"
    end 
  end
  
end
