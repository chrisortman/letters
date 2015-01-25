class HomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to login_url
      return
    end

  end
end
