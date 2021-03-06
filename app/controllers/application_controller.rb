class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox || current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :names, :email, :password, :role_id ,:phone , :country, :date_of_birth ,:gender ,:height , :weight, :city ,:bust , :waist, :eye_color , :shoe_size)  }
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :names, :email, :password, :current_password, :avatar,:phone , :country, :date_of_birth ,:gender ,:height , :weight, :city ,:bust , :waist, :eye_color , :shoe_size ,:experience ,:job_interest , :dislikes ,:mua_type) }
    end
end
