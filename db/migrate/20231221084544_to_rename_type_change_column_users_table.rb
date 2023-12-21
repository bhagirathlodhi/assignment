class ToRenameTypeChangeColumnUsersTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :status, :blocked
  end
end
