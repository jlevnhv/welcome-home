class UsersController < ApplicationController
  include ApplicationHelper

  def new
    verify_admin(message: "Only admins can create new users")
    @user = User.new
  end

  def index
    verify_admin(message: "Only admins can view users")
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User created"
    else
      render @new
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_user_is_admin? || current_user.id == @user.id
      redirect_to user_path(current_user), alert: "Only admins can view other users"
    end
  end

  def edit
    verify_admin(message: "Only admins can edit other user's pages")
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), alert: "User updated"
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to users_path,alert: "User removed"
  end

  private

  def verify_admin(message:)
    unless current_user_is_admin?
      redirect_to user_path(current_user), alert: message
    end
  end

  def user_params
    params.
      require(:user).
      permit(:username, :password, :first_name, :last_name, :email)
  end
end
