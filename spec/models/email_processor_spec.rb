require 'rails_helper'

RSpec.describe EmailProcessor do

  let(:user_email) { generate(:email) }
  let(:body) { "This is my story" }
  let(:message) { 
      build(:email, from: user_email, body: body) 
  }
  let(:ep) { EmailProcessor.new(message) }

  describe 'story message' do

    it 'creates a new story' do
      expect { 
        ep.process
      }.to change(Story,:count).by(1)
    end
  end

  describe 'subscribe message' do

    let(:body) { 'subscribe' }

    context 'from new subscriber' do
      
      it 'creates a new subscription' do

        expect {
          ep.process
        }.to change(Subscription,:count).by(1)
        
        expect(Subscription.last.email).to eq(user_email)
      end

      it 'sends a welcome email' do
        expect(Notification).to receive(:welcome).with(user_email)
        ep.process

      end

    end

    context 'from existing subscriber' do

      before { Subscription.create(email: user_email) }

      it 'does not create a new subscription' do
        expect {
          ep.process
        }.to_not change(Subscription,:count)
      end
    end

  end

  describe 'unsubscribe message' do
    let(:body) { 'unsubscribe\r\n' }

    context 'from existing subscriber' do

      it 'removes the subscription' do
        Subscription.create(email: user_email)
        ep.process
        expect(Subscription.where(email: user_email).count).to eq(0)
      end

    end

    context 'from a non-subsciber' do

      it 'does nothing if the user is not subscribed' do
        expect {
          ep.process
        }.to_not raise_error
      end

    end


  end
end
