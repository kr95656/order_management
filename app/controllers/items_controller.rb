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
    # postage_payer =  PostagePayer.find(@item.postage_payer_id)
    @postage_payer = postage_payer.name
    weight = Weight.find(@item.weight_id)
    @weight = weight.name
  end

  private

  def item_params
    params.require(:item).permit(:price, :name, :tax, :size_id, :weight_id)
  end

end
