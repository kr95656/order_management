class ItemsController < ApplicationController

  def index
    @items = Item.all
    # @item = Item.find_by(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    weight = Weight.find(@item.weight_id)
    @weight = weight.name
    size = Size.find(@item.size_id)
    @size = size.name
    shipping_prefecture = ShippingPrefecture.find(@item.shipping_prefecture_id)
    @shipping_prefecture = shipping_prefecture.name
    shipping_day = ShippingDay.find(@item.shipping_day_id)
    @shipping_day = shipping_day.name
  end

  private

  def item_params
    params.require(:item).permit(:price, :name, :tax, :size_id, :weight_id, :shipping_prefecture_id, :shipping_day_id)
  end

end
