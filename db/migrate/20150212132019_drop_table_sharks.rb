class DropTableSharks < ActiveRecord::Migration
  def change
    drop_table :sharks
  end
end
