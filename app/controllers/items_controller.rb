# This is ItemController class
# require 'net/http'

class ItemsController < ApplicationController
  before_action :require_login
  # after_action :send_item, on: :create
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Item was successfully added"
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "Item was successfully updated"
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Item was successfully deleted"
    redirect_to items_path, status: :see_other
  end

  private

  def require_login
    return if logged_in?

    flash[:danger] = "You must be logged in to access this section"
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :quantity)
  end

  # def send_item(item)
  #   uri = URI("http://localhost:8000/webhooks/handle")
  #   params = { item: item.to_json }
  #   response = Net::HTTP.post_form(uri, params)
  #   puts response.body
  # end
end
