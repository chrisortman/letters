require 'rails_helper'

RSpec.describe EmailProcessor do


  it 'creates a new story' do
    expect {
      ep = EmailProcessor.new(build(:email))
      ep.process
    }.to change(Story,:count).by(1)
  end

  context 'a first time subscriber' do

    it 'sends a welcome email' do
      ep = EmailProcessor.new(build(:email, from: 'newuser@example.com'))
      ep.process

      expect(ActionMailer::Base.deliveries).to_not be_empty
      
    end
  end
end
