class UserMailer < ActionMailer::Base
  default from: "Auctions.CSBaker@gmail.com"

  def welcome_mail(email)
    mail(:to => email, :subject => "Welcome to Overflow").deliver
  end
  def outbid_email(user)
     @user = user
     @url = "http://railsme.asuscomm.com/auctions/items"
      mail(to: @user.email, subject: 'You have been outbid!')
end
