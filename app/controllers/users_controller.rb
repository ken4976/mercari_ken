class UsersController < ApplicationController
  before_action :move_to_sign_in

  def show
    @purchase_items = Item.where(buyer_id: current_user.id).where(trading_status: 0)
    @purchased_items = Item.where(buyer_id: current_user.id).where(trading_status: 1)
  end

  def notification
  end

  def todo
  end

  def like_history
  end

  def news
  end

  def review_history
  end

  def review_history_great
  end

  def review_history_good
  end

  def review_history_poor
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

end
