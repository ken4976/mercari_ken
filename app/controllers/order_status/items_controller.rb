class OrderStatus::ItemsController < ApplicationController

  def index
    @items = current_user.sold_items
  end

  def show
    @item = Item.find(params[:id])
  end

  def pre_index
    @items = current_user.sold_items
    render 'sales_transfer'
  end
end
