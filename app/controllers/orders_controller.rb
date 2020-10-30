class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_move_to_index, only: [:index]
  before_action :buy_myself_move_to_index, only: [:index]

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_move_to_index
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def buy_myself_move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
