class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_purchase = OrderPurchase.new
    @purchases = Purchase.all

    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @purchases.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def create
    set_order
    @order_purchase = OrderPurchase.new(order_purchase_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private
  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_purchase_params
    params.require(:order_purchase).permit(:post_code, :shipping_area_id, :city, :block, :building, :phone_number)
          .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.product_price,
      card: order_purchase_params[:token],
      currency: 'jpy'
    )
  end
end
