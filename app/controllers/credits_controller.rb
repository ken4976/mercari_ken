class CreditsController < ApplicationController
  before_action :set_credit, only: [:destroy]

  def index
    @credit = Credit.find_by(user_id: current_user.id)
  end

  def new
    @credit = Credit.new
  end

  def create
    Credit.create(credit_params)
    redirect_to mains_top_path
  end

  def destroy
    @credit.destroy
    redirect_to mains_top_path
  end

  private

  def credit_params
    params.require(:credit).permit(:num, :expire_month, :expire_year, :security_code).merge(user_id: current_user.id)
  end

  def set_credit
    @credit = Credit.find(params[:id])
  end
end
