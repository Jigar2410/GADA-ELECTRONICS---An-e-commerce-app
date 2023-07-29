class OrderItemsController < ApplicationController
  def create
    @cart_items = session[:cart]
    @cart_id = session[:cart_id]
    @cart_items.each do |item|
      @order_item = OrderItem.new
      @order_item.cart_id = @cart_id
      @order_item.item_id = item["id"]
      @order_item.item_name = item["name"]
      @order_item.item_quantity = item["quantity"]
      @order_item.item_total_price = item["total_price"]
      @order_item.save
    end
    redirect_to create_order_path
  end
end
