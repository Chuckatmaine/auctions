class RemoveIdFromAuctionUsers < ActiveRecord::Migration
  def change
   remove_column :auction_users, :id
  end
end
