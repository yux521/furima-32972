class OrdersController < ApplicationController
  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_address_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_address_params
    params.permit(:postal_code, :area_id, :municipalities, :number, :building, :tel, :item_id).merge( user_id: current_user.id)
  end
end
