class SubscriptionsController < ApplicationController
  before_filter :must_be_logged_in, :must_be_admin, :only => [:index]

  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end

  def create

    sub = Subscription.where(email: subscription_params[:email])

    if sub.size == 0
      sub = Subscription.create(subscription_params)
    end
    
  end

  protected

  def current_user_is_subscribing?
    logged_in? && subscription_params[:email] == current_user.email
  end

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
