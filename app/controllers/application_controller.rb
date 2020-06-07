class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def admin_user
    if user_signed_in?
      redirect_to root_path unless current_user.admin?
    else
      redirect_to root_path
    end
  end

  protected

  # name,imageカラム追加のストロングパラメータ
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :image_cache])
  end

end
