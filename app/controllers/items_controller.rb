class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_status_id, :shipping_fee_id,
                                 :shipping_area_id, :delivery_time_id, :product_price, :image).merge(user_id: current_user.id)
  end
end
