ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :email
    column :blocked
    actions do |user|
      item "Block", block_admin_user_path(user), method: :put unless user.blocked?
      item "Unblock", unblock_admin_user_path(user), method: :put if user.blocked?
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

  ActiveAdmin.register User do
    actions :index, :edit, :update, :create, :destroy

    permit_params :name, :email, :status

    form do |f|
      f.inputs 'User Details' do
        
        f.input :status, label: 'Blocked'
      end
      f.actions
    end
  end
  
end
