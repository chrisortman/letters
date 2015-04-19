class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.login_from_facebook(auth_hash)
    session[:user_id] = user.id

    # Currently using the Facebook JS method to login
    # so we return true, and in our session/new view
    # we decide where we are redirecting to
    respond_to do |format|
      format.html { redirect_to me_url}
      format.js { render :js => "true" }
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url
  end

  def login_error
    render :text => "Sorry"
  end

  protected
  
  def auth_hash
    request.env['omniauth.auth']
  end

end
