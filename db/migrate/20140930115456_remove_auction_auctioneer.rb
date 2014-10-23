class RemoveAuctionAuctioneer < ActiveRecord::Migration
  def change
   remove_column :auctions, :auctioneer_id
  end
end
