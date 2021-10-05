class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_update_path_for(resource)
    user_path(current_user)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company, :occupation, :position])
  end
end
