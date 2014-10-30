class UserMailer < ActionMailer::Base
  default from: 'auctions.csbaker@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://railsme@asuscomm.com/auctions'
    mail(to: @user.email, subject: 'Welcome to the Auctions Site')
  end
end
