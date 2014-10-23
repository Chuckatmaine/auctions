class RemoveCreateDestroy < ActiveRecord::Migration
  def change
   remove_column :auctioneers, :create
   remove_column :auctioneers, :destroy
  end
end
