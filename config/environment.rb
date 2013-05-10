# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Motivator::Application.initialize!

ActionMailer::Base.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :user_name            => ENV["GMAIL_USERNAME"],
   :password             => ENV["GMAIL_PASSWORD"],
   :authentication       => :login
}
