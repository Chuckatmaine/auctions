class Change < ActiveRecord::Migration
  def change
   rename_column :users, :admin, :is_admin
   rename_column :users, :auctioneer, :is_auctioneer
  end
end
