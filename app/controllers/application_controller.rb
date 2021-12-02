class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    sesssion[:shopping_cart] ||= []
  end

  def cart
    Wine.find(:shopping_cart)
  end
end
