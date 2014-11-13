class AddFinalizedToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :finalized, :boolean
  end
end
