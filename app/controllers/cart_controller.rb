class CartController < ApplicationController
  def create
    wine_id = params[:id].to_i
    quantity = params[:quantity].to_i

    session[:shopping_cart] << { wine_id: wine_id, quantity: quantity }
    redirect_to root_path
  end

  def update
    wine_id = params[:id].to_i
    quantity = params[:quantity].to_i
    wine_order = session[:shopping_cart].detect { |x| x["wine_id"] == wine_id }
    wine_order["quantity"] = quantity
    redirect_to root_path
  end

  def destroy
    wine_id = params[:id].to_i
    wine_order = session[:shopping_cart].detect { |x| x["wine_id"] == wine_id }
    session[:shopping_cart].delete(wine_order)
    redirect_to root_path
  end

  def index
    @line_items = []
    session[:shopping_cart].each do |o|
      wine = Wine.find(o["wine_id"])
      quantity = o["quantity"].to_i

      @line_items << WineOrder.new(quantity: quantity,
                                   price:    wine.price * quantity,
                                   wine:     wine)
    end
  end
end
