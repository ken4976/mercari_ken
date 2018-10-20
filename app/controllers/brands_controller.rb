class BrandsController < ApplicationController
  
  def show
  	@brand = Brand.find(params[:id])
    @items = Brand.find(params[:id]).items.order("RAND()").limit(4)
  end
end
