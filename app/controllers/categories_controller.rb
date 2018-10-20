class CategoriesController < ApplicationController
  
  def show
  	@category = Category.find(params[:id])
    @items = Category.find(params[:id]).items.order("RAND()").limit(4)
  end

  private

  # def item_params
  #   params.require(:item).permit(
  # end
end
