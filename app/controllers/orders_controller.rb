class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
    @purchases = Purchase.all

    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @purchases.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_purchase_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_purchase_params
    params.require(:order_purchase).permit(:post_code, :shipping_area_id, :city, :block, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
