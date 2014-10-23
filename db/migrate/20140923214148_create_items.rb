class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.float :start_bid
      t.float :bid_increment
      t.integer :auction_id
      t.boolean :is_donation
      t.boolean :buyitnow

      t.timestamps
    end
  end
end
