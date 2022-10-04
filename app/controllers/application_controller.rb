class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # prevent users to perfrom action without authentication
  # before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def after_sign_out_path_for(_scope)
    root_path
  end
end
