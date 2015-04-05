require "rails_helper"

RSpec.describe Notification, :type => :mailer do
  describe "welcome" do
    let(:mail) { Notification.welcome('to@example.com') }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq(["to@example.com"])
      expect(mail.from).to eq(["paul@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
