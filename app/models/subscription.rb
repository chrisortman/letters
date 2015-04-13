class Subscription < ActiveRecord::Base
  def user?
    User.where(email: email).count > 0
  end
end
