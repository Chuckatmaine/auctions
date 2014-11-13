class CreateSharks < ActiveRecord::Migration
  def change
    create_table :sharks do |t|
      t.integer :tag_id
      t.string :species

      t.timestamps
    end
  end
end
