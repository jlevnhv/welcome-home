module ApplicationHelper
  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
end
