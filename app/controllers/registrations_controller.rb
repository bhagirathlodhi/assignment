# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted? && resource.blocked?
        sign_out(resource)
        flash[:alert] = 'Your account is blocked. Please contact the administrator.'
        redirect_to new_user_session_path
      end
    end
  end

  private

  def check_user_blocked
    if current_user&.blocked?
      sign_out(current_user)
      flash[:alert] = 'Your account is blocked. Please contact the administrator.'
      redirect_to root_path
    end
  end
end
