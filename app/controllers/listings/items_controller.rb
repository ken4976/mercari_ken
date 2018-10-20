class Listings::ItemsController < ApplicationController
  before_action :move_to_sign_in

  def index
    @items = Item.where(seller_id: current_user.id).where(buyer_id: nil)
  end

  def show
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
