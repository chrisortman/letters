require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it 'is subscribed if there is a subscription with same email address' do
    
    u = create(:user)
    sub = create(:subscription,email: u.email)

    expect(u).to be_subscribed
  end

end
