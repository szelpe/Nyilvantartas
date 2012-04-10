module ApplicationHelper
  def logged_in?
    session[:user]
  end
end
