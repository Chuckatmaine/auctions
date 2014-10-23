class RenameColumnAuctioneerToUser < ActiveRecord::Migration
  def change
   rename_column :auctions_users, :auctioneer_id, :user_id  
  end
end
