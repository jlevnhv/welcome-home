class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def index
    if current_user_is_admin?
      @users = User.all
    else
      redirect_to user_path(current_user), alert: "Only admins can see all users"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render @new
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_user_is_admin? || current_user.id == @user.id
      redirect_to user_path(current_user), alert: "Only admins can view other users pages"
    end
  end

  private

  def user_params
    params.
      require(:user).
      permit(:username, :password, :first_name, :last_name, :email)
  end
end
