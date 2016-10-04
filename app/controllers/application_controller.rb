class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def task
  	render "static_pages/task"
  end
  def description
  	render "static_pages/description"
  end
  protected
  def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation) } 
  end 
end
