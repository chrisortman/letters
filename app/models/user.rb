class User < ActiveRecord::Base

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
  end
end
