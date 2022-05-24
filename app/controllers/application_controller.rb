class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(resource)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:age,:username,:image,:email,:password] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:age,:username,:image, :email, :password, :password_confirmation] )
  end
end
