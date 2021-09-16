class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :index]

  def after_sign_in_path_for(resource)
    posts_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
