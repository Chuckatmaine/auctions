class RemoveUsersEmailold < ActiveRecord::Migration
  def change
    remove_column :users, :email_old
  end
end
