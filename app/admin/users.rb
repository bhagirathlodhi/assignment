ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :blocked
    actions do |user|
      if user.admin?
      else
        item "Block", block_admin_user_path(user), method: :put unless user.blocked?
        item "Unblock", unblock_admin_user_path(user), method: :put if user.blocked?
      end
    end
  end

    member_action :block, method: :put do
      resource.update(blocked: true)
      redirect_to admin_users_path, notice: "User blocked!"
    end

    member_action :unblock, method: :put do
      resource.update(blocked: false)
      redirect_to admin_users_path, notice: "User unblocked!"
    end
  

end
