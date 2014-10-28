class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  validates_presence_of :item_id, :user_id, :amount
  validate :minbid  
def minimum_bid
    bids = self.item.bids
    if !self.item.buyitnow && !bids.blank? && !self.item.is_donation then
       @minbid = bids.maximum("amount") + self.item.bid_increment
    else
      @minbid = self.item.start_bid
    end
end
def outbid
    if bids.last 
      @outbid_user = bids.last.user_id
      else @outbid_user = null
    end
end

  private
def minbid
     bids = self.item.bids
     if self.amount.blank?
        message = " - Please enter a bid."
        errors.add(:amount, message)
     else     
        if !self.item.buyitnow  && !bids.blank? && !self.item.is_donation then
         minbid = bids.maximum("amount") + self.item.bid_increment
       else
         minbid = self.item.start_bid
       end
       unless self.amount >= minbid 
          message = " - Please bid at least as high as the minimum bid: $#{minbid}"
          errors.add(:amount, message) unless self.amount >= minbid
       end
     end
end
end
