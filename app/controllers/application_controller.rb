class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:names, :email, :password, :is_admin, :is_mua, :is_contributor, :is_model) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:names, :email, :password, :current_password, :avatar) }
    end
end