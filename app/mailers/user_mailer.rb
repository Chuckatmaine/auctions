class UserMailer < ActionMailer::Base
  default from: "Auctions.CSBaker@gmail.com"

  def welcome_mail(email)
    @user = user
    @url = "http://railsme.asuscomm.com/auctions/"
    mail(:to => email, :subject => "Welcome to the Auctions site").deliver
  end
  def outbid_email(user)
     @user = user
     @url = "http://railsme.asuscomm.com/auctions/"
     mail(to: @user.email, subject: 'You have been outbid!')
  end
end
