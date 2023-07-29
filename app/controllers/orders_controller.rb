class OrdersController < ApplicationController
  before_action :require_login
  def index
    @orders = session[:user_id] == 1 ? Order.all : Order.where(user_id: session[:user_id])
  end

  def new
    if !session[:cart_id]
      session[:cart_id] = SecureRandom.uuid
      @order = Order.create(id: session[:cart_id], user_id: session[:user_id], total_amount: 0)
      redirect_to items_path
    else
      flash[:danger] = "You have unconfirmed order in your cart"
      redirect_to cart_path(session[:cart_id])
    end
  end

  def create
    @order = Order.find_by(id: session[:cart_id])
    @order.update(total_amount: session[:grand_total])

    if @order.save
      flash[:success] = "Your order was confirmed"
    else
      flash[:danger] = "Your order was not confirmed"
    end
    session[:cart] = nil
    session[:cart_id] = nil
    session[:grand_total] = nil
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(cart_id: params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = "Your order was successfully deleted"
    redirect_to orders_path, status: :see_other
  end

  private

  def require_login
    return if logged_in?

    flash[:danger] = "You must be logged in to access this section"
    redirect_to root_path
  end
end
