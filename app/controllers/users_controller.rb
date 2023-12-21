class UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def block_user
    debugger
    user = User.find(params[:id])
    user.update(status: :blocked)
    redirect_to :back, notice: "#{user.email} has been blocked."
  end

  def unblock_user
    user = User.find(params[:id])
    user.update(status: :unblocked)
    redirect_to :back, notice: "#{user.email} has been unblocked."
  end
end
