class AddQtyToBid < ActiveRecord::Migration
  def change
    add_column :bids, :qty, :integer
  end
end
