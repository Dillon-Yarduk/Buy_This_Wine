class CartController < ApplicationController
  def create
    wine_id = params[:id].to_i
    quantity = params[:quantity].to_i
    wine = Wine.find(wine_id)

    wine_order = WineOrder.new(
      quantity: quantity,
      price:    quantity * wine.price,
      wine:     wine
    )

    session[:shopping_cart] << wine_order
    redirect_to root_path
  end

  def update
    wine_id = params[:id].to_i
    quantity = params[:quantity].to_i
    wine_order = session[:shopping_cart].detect {|wine_order| wine_order["wine_id"] == wine_id}
    wine_order["quantity"] = quantity
    redirect_to root_path
  end

  def destroy
    wine_id = params[:id].to_i
    wine_order = session[:shopping_cart].detect {|wine_order| wine_order["wine_id"] == wine_id}
    session[:shopping_cart].delete(wine_order)
    redirect_to root_path
  end
end
