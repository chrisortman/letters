class User < ActiveRecord::Base

  has_many :stories

  def subscribed?
    sub = Subscription.where(email: email).count > 0
  end

  def admin?
    email == 'chrisortman@gmail.com'
  end

  class << self
    
    def login_from_facebook(auth_hash)
      facebook_id = auth_hash[:uid]

      user = User.where(facebook_id: facebook_id).first

      if user.nil?
        user = User.create!(facebook_id: facebook_id.to_s)
      end

      user.name  = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
      user.save!

      user
    end

    def from_email(email)
      where(email: email).first
    end
  end
end
