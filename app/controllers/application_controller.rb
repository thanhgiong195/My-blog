class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:avatar, :name, :address, :phone]
  end

  private

  def logged_in_user
    return if user_signed_in?
    flash[:danger] = t ".pl_login"
    redirect_to signin_path
  end
end
