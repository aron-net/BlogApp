class ApplicationController < ActionController::Base
  # layout "application"
  add_flash_types :danger, :info, :warning, :success, :messages
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # user_signed_in?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
end
