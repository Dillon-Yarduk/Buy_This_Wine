class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :initialize_session
  helper_method :cart

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :address, :province_id, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :address, :province_id, :email, :password, :current_password)}
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Wine.find(session[:shopping_cart])
  end
end
