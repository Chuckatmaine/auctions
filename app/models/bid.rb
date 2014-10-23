class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  validates_presence_of :item_id, :user_id
  validate :minbid  
def minimum_bid
    bids = self.item.bids
    if !self.item.buyitnow then
      @minbid = bids.maximum("amount") + self.item.bid_increment
    else
      @minbid = self.item.start_bid
    end
end
  private


def minbid
       bids = self.item.bids
    if !self.item.buyitnow then
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
