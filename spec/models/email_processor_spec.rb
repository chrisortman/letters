require 'rails_helper'

RSpec.describe EmailProcessor do


  it 'creates a new story' do
    expect {
      ep = EmailProcessor.new(build(:email))
      ep.process
    }.to change(Story,:count).by(1)
  end

  context 'subscribe message' do
    let(:user_email) { generate(:email) }
    let(:subscribe_message) { 
      build(:email, from: user_email, body: 'subscribe\r\n') 
    }

    it 'creates a new subscription' do
      expect {
        ep = EmailProcessor.new(subscribe_message)
        ep.process
      }.to change(Subscription,:count).by(1)

      expect(Subscription.last.email).to eq(user_email)
    end
  end

  context 'unsubscribe message' do
    let(:user_email) { generate(:email) }
    let(:message) { 
      build(:email, from: user_email, body: 'unsubscribe\r\n') 
    }

    it 'does nothing if the user is not subscribed' do
      expect {
        ep = EmailProcessor.new(message)
        ep.process
      }.to_not raise_error
    end

    it 'removes the subscription' do
      Subscription.create(email: user_email)
      ep = EmailProcessor.new(message)
      ep.process
      expect(Subscription.where(email: user_email).count).to eq(0)
    end
  end

  context 'a first time subscriber' do

    it 'sends a welcome email' do
      ep = EmailProcessor.new(build(:email, from: 'newuser@example.com'))
      ep.process

      pending "generate the subscriber email"
      fail
      
    end
  end
end
