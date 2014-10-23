class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :auctioneer, null: false
      t.string :title, null: false, default: ""
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :display, default: 0
      t.text :winner_message, null:false

      t.timestamps
    end
  end
end
