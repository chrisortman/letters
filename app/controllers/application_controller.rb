class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  protected

  def must_be_logged_in
    if ! logged_in? || current_user.nil?
      redirect_to login_url
    end
  end

  def must_be_admin
    if logged_in? && current_user.present?
      if ! current_user.admin?
        render :nothing, :status => 404
      end
    end
  end

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
