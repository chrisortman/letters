ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 25,
  :user_name => ENV['MANDRILL_USERNAME'],
  :password  => ENV['MANDRILL_API_KEY'],
  :authentication => 'login',
  :domain    => 'heroku.com'
}

ActionMailer::Base.delivery_method = :smtp

