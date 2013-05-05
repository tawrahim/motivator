class UserMailer < ActionMailer::Base
  default from: "no-reply@motivator.com"

  def welcome_email(user)
    @name = user.name
    @email = user.email
    mail(to: @email, subject: "Thank you for signing up for Ogyam!")
  end
end
