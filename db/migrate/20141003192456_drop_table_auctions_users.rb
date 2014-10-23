class DropTableAuctionsUsers < ActiveRecord::Migration
  def change
   drop_table :auctions_users
  end
end
