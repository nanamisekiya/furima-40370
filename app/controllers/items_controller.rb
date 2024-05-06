class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
    @purchases = Purchase.all
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
    @purchases = Purchase.all
  end

  def edit
    @purchases = Purchase.all
    if @purchases.exists?(item_id: @item.id) || current_user.id != @item.user.id 
    redirect_to root_path
    end

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user == item.user
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_status_id, :shipping_fee_id,
                                 :shipping_area_id, :delivery_time_id, :product_price, :image).merge(user_id: current_user.id)
  end
end
