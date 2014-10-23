class CreateAuctionUsers < ActiveRecord::Migration
  def change
    create_table :auction_users do |t|
      t.integer "auction_id"
      t.integer "auctioneer_id"
      t.timestamps
    end
  end
end
