class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]

  def new
    @address = Address.new

    @user = current_user
    @address = Address.where(user_id: @user.id).first_or_initialize
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(current_user), notice: '住所を変更しました'
    else
      render :new

    end
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end


private
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:area, :city, :postal_code, :address1, :address2, :family_name, :first_name, :family_name_kana, :first_name_kana).merge(user_id: current_user.id)
  end
end
