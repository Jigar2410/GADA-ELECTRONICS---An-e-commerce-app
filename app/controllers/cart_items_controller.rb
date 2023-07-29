class CartItemsController < ApplicationController
  def edit
    @item = session[:cart].find { |i| i["id"] == params[:id].to_i }
  end

  def update
    @item = session[:cart].find { |i| i["id"] == params[:id].to_i }
    @item_original = Item.find(params[:id].to_i)
    item_quantity = @item_original.quantity
    if params[:quantity].to_i <= 0
      flash[:danger] = "The quantity should be more than 0"
    elsif (params[:quantity].to_i - @item["quantity"].to_i) > item_quantity
      flash[:danger] = "Sorry ! we have only #{Item.find(params[:id].to_i).quantity} quantity"
    else
      session[:grand_total] -= @item["total_price"]
      @item_original.update(quantity: item_quantity + (@item["quantity"].to_i - params[:quantity].to_i))
      @item["total_price"] = (@item["total_price"] / @item["quantity"].to_i) * params[:quantity].to_i
      @item["quantity"] = params[:quantity].to_i
      session[:grand_total] += @item["total_price"]
    end
    redirect_to cart_path
  end

  def destroy
    item = session[:cart].find { |i| i["id"] == params["id"].to_i }
    @item_original = Item.find(params["id"].to_i)
    item_quantity = @item_original.quantity
    @item_original.update(quantity: item_quantity + item["quantity"].to_i)
    session[:grand_total] -= item["total_price"]
    session[:cart].delete(item)
    flash[:success] = "Item was successfully deleted"
    redirect_to cart_path, status: :see_other
  end
end
