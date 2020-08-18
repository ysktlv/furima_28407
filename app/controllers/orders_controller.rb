class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_login
  before_action :move_to_top

  def index
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :postal_code, :prefecture, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: "jpy"
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end
