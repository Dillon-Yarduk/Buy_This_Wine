class CheckoutController < ApplicationController
  def create
    line_items = []

    subtotal = 0

    session[:shopping_cart].each do |li|
      wine = Wine.find(li["wine_id"])
      quantity = li["quantity"].to_i
      subtotal += wine.price * quantity
      line_items << {
        name:        "#{wine.name}, #{wine.variety.name}",
        description: wine.description,
        amount:      (wine.price * quantity * 100).to_i,
        currency:    "cad",
        quantity:    quantity
      }
    end

    gst = current_customer.province.gst * subtotal
    pst = current_customer.province.pst * subtotal
    hst = current_customer.province.hst * subtotal

    unless gst.zero?
      line_items += [{
        name:        "GST",
        description: "Goods and Services Tax.",
        amount:      (gst * 100).to_i,
        currency:    "cad",
        quantity:    1
      }]
    end
    unless pst.zero?
      line_items += [{
        name:        "PST",
        description: "Provincial Sales Tax.",
        amount:      (pst * 100).to_i,
        currency:    "cad",
        quantity:    1
      }]
    end
    unless hst.zero?
      line_items += [{
        name:        "HST",
        description: "Harmonized Sales Tax.",
        amount:      (hst * 100).to_i,
        currency:    "cad",
        quantity:    1
      }]
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url,
      line_items:           line_items
    )

    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    order = Order.create!(
      customer: current_customer,
      status:   Status.find_by(name: "paid"),
      subtotal: 0,
      gst:      0,
      pst:      0,
      hst:      0,
      total:    0
    )
    wine_orders = []
    session[:shopping_cart].each do |wo|
      wine = Wine.find(wo["wine_id"])
      quantity = wo["quantity"].to_i
      wine_orders << WineOrder.create!(
        wine:     wine,
        order:    order,
        quantity: quantity,
        price:    wine.price * quantity
      )
    end
    order.subtotal = wine_orders.inject(0) { |sum, x| sum + x.price }
    order.gst = order.subtotal * order.customer.province.gst
    order.pst = order.subtotal * order.customer.province.pst
    order.hst = order.subtotal * order.customer.province.hst
    order.total = order.subtotal + order.gst + order.pst + order.hst
    order.save
    session[:shopping_cart] = []

    flash[:notice] = "Order Completed Successfully!!!!!!1!"
    redirect_to orders_show_path(order, id: order.id)
  end

  def cancel; end
end
