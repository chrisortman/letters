require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "new_letter" do
    mail = Notification.new_letter
    assert_equal "New letter", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
