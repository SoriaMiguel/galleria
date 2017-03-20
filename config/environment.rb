# Load the Rails application.
require_relative 'application'
# config.action_mailer.default_url_options = { :host => 'localhost' }


# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'safe-citadel-25734.herokuapp.com',



  # change to my heroku url




  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
