class UserMailer < ActionMailer::Base
  default from: "Auctions.CSBaker@gmail.com"

  def welcome(user)
    @user = user
    @url = "http://railsme.asuscomm.com/auctions/"
    mail(:to => user.email, :subject => "Welcome to the Auctions site").deliver
  end
  def won_item(auction, wonitems, user)
    @user = user
    @auction = auction
    auctioneer = Auctioneer.where(auction_id: @auction.id)
    owner = @auction.auctioneer
    @wonitems = wonitems
    @url = "http://railsme.asuscomm.com/auctions/"
    mail(:to => user, :bcc => owner.email, :subject => "You have won items from the auctions site").deliver
  end
  def outbid(bid)
     @bid = bid
     @user = @bid.user
     @url = "http://railsme.asuscomm.com/auctions/auctions/" + @bid.item.auction_id.to_s + "/auction_items/"
     mail(to: @user.email, subject: 'You have been outbid!')
  end
end
