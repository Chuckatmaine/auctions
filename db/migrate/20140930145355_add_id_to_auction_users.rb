class AddIdToAuctionUsers < ActiveRecord::Migration
  def change
   add_column :auction_users, :id, :primary_key
  end
end
