class RenameColumnItemOrderToSeq < ActiveRecord::Migration
  def change
    rename_column Item, :order, :seq
  end
end
