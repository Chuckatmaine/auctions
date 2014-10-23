class ChangeAuctionsAuctioneerToId < ActiveRecord::Migration
  def change
    rename_column :auctions, :auctioneer, :auctioneer_id
  end
end
