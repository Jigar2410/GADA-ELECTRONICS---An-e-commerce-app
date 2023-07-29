class CartsController < ApplicationController
  def add_to_cart

    item = Item.find(params[:id])
    if params[:quantity].to_i <= 0
      flash[:danger] = "The quantity should be more than 0"
    elsif item.quantity < params[:quantity].to_i
      flash[:danger] = "Sorry! We don't have enough quantity"
    else
      item.update(quantity: item.quantity - params[:quantity].to_i)

      product = {
        id:          item.id,
        name:        item.name,
        quantity:    params[:quantity].to_i,
        total_price: item.price * params[:quantity].to_i
      }
      cart = session[:cart] || []
      grand_total = session[:grand_total] || 0

      existing_item = cart.find { |i| i["id"] == product[:id] }
      if existing_item
        existing_item["quantity"] += product[:quantity]
        existing_item["total_price"] += product[:total_price]
      else
        cart << product
      end
      grand_total += product[:total_price]

      session[:grand_total] = grand_total
      session[:cart] = cart
    end
    redirect_to items_path
  end

  def show
    @cart_items = session[:cart]
    if @cart_items.blank?
      flash[:danger] = "Your cart is empty"
      redirect_to items_path
    end
    @grand_total = session[:grand_total]
  end

  def edit
    @cart_items = session[:cart]
  end

  def destroy
    @cart_items = session[:cart]
    @cart_items.each do |i|
      item = Item.find(i["id"])
      item.update(quantity: item.quantity + i["quantity"])
    end
    user_id = session[:user_id]
    cart_id = session[:cart_id]
    reset_session
    session[:user_id] = user_id
    flash[:success] = "Your cart was successfully deleted"
    Order.find_by(id: cart_id).destroy
    redirect_to orders_path, status: :see_other
  end
end
