class AuctionsAndUsers < ActiveRecord::Migration
  def change
    create_table :auctions_users, id: false do |t|
      t.belongs_to :auction
      t.belongs_to :user
    end
  end
end
