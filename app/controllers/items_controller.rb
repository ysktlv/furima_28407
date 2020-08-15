class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @item = Item.all.order("created_at DESC")
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
      render "new"
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
end
