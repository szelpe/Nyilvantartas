module ApplicationHelper
  def logged_in?
    session[:user]
  end
  
  def current_user
    User.find_by_id session[:user]
  end
end
