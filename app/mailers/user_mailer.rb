class UserMailer < ActionMailer::Base
  default from: "brianroth@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://secret-refuge-6204.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Pocket Planes Marketplace')
  end
end
