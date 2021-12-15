class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:wine_orders, :status).all
  end

  def show
    @order = Order.includes(:wine_orders, :status).find(params[:id])
  end
end
