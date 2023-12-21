class ToChangeColumnNameUser < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :blocked, :status
  end
end
