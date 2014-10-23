class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :street
      t.string :state
      t.string :zip
      t.string :phone
      t.boolean :is_admin
      t.boolean :is_auctioneer

      t.timestamps
    end
  end
end
