class Purchase::ItemsController < ApplicationController
  before_action :move_to_sign_in

  def index
    @items = Item.where(buyer_id: current_user.id).where(trading_status: 0)
  end

  def show
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
