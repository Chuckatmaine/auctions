class AddPaymentToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :payment, :text
  end
end
