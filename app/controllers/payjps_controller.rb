class PayjpsController < ApplicationController
  before_action :move_to_sign_in
  before_action :move_to_mypage, except: [:show]

  def show
  end

  def new
  end

  def create
    Payjp.api_key = 'sk_test_239330b9aad9f2b589277acb'
    customer = Payjp::Customer.create(
      :card  => params['payjp-token']
    )
    Customer.create(token: customer.id, user_id: current_user.id)
    redirect_to user_path(current_user), notice: 'クレジットカードを登録しました'
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_mypage
    redirect_to user_path(current_user) if current_user.customer.present?
  end
end
