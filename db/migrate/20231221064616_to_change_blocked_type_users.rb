class ToChangeBlockedTypeUsers < ActiveRecord::Migration[7.1]
  def change
    change_column(:users, :blocked, :integer)
  end
end
