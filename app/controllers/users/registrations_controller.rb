class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:block, :unblock]
  before_action :set_devise_mapping


  def index
    @users = User.all
  end

  def block
    user = User.find(params[:id])
    user.update(blocked: true)
    redirect_to root_path, notice: "#{user.email} has been blocked."
  end

  def unblock
    user = User.find(params[:id])
    user.update(blocked: false)
    redirect_to root_path, notice: "#{user.email} has been unblocked."
  end

  private

  def set_devise_mapping
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

end
