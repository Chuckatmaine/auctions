class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :shark_id
      t.datetime :date
      t.float :latitude
      t.float :longitude
      t.boolean :offshore
      t.boolean :gt5miles
      t.integer :angler_id
      t.integer :tagger_id
      t.text :comments
      t.integer :number

      t.timestamps
    end
  end
end
