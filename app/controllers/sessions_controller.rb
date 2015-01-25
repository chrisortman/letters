class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.login_from_facebook(auth_hash)
    session[:user_id] = user.id

    respond_to do |format|
      format.html {redirect_to :home}
      format.js { render :js => "true" }
    end

  end

  def destroy
    session[:user_id] = nil
  end

  def login_error
    render :text => "Sorry"
  end

  protected
  
  def auth_hash
    request.env['omniauth.auth']
  end

end
