class CreateAuctioneers < ActiveRecord::Migration
  def change
    create_table :auctioneers do |t|
      t.integer :user_id
      t.integer :auction_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
