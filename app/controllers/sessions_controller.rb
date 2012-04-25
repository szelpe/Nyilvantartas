class SessionsController < ApplicationController
  def create
    @current_user = User.authenticate(params[:username], params[:password])
    if @current_user
      session[:user]=@current_user.id
      redirect_to :back
    else
      flash[:notice]='Invalid user name or password'
      redirect_to :back
    end
  end

  def destroy
    reset_session
    flash[:notice]='Logged out successfully'
    redirect_to :back
  end
end
