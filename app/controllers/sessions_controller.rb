class SessionsController < ApplicationController
  include ApplicationHelper

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      message = "Username or password not recognized, please try again"
      redirect_to login_path, notice: message
    end
  end

  def destroy
    reset_session
    message = "You are now logged out"
    redirect_to login_path, notice: message
  end
end
