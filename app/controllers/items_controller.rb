class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    if user_signed_in? && current_user.id ==  @item.user_id
 
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.id ==  @item.user_id
      @item.update(item_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:quality_id, :price, :shipping_id, :area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
