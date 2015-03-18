class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    sub = Subscription.where(email: subscription_params[:email])

    if sub.size == 0
      sub = Subscription.create(subscription_params)
    end
    
  end

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
