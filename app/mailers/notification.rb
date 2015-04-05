class Notification < ApplicationMailer

  default from: 'paul@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.new_letter.subject
  #
  def new_letter(letter)
    @letter = letter
    mail to: "chrisortman@gmail.com", subject: 'New Letter'
  end

  def welcome(user_email)
    
    mail to: user_email, subject: "Welcome"
  end
end
