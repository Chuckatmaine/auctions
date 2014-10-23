class RenameAuctionUsersToAuctionsUsers < ActiveRecord::Migration
  def change
   rename_table :auction_users, :auctions_users
  end
end
