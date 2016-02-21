class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    @current_user ||= current_hacker || current_student
  end

  def after_sign_in_path_for(resource)
    eval "#{resource.class.name.downcase}_path"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [language_ids: []] << :first_name << :last_name
  end
end
