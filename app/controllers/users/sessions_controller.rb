# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  before_action :check_blocked, only: :create

  private

  def check_blocked
    user = User.find_by(email: params[:user][:email])

    if user && user.blocked?
      sign_out current_user if current_user
      redirect_to new_user_session_path, alert: 'Your account is blocked. Please contact the administrator.'
    end
  end
end
