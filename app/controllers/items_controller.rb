class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_status_id, :shipping_fee_id, :shipping_area_id, :delivery_time_id, :product_price).merge(user_id: current_user.id)
  end
end
