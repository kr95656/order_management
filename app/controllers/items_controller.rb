class ItemsController < ApplicationController
  
  def index; end

  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    binding.pry 
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def create
  #   @item = Item.create(item_params)
  #   if @item.save
  #     flash[:notice] = "投稿完了しました"
  #     redirect_to root_path
  #   else
  #     flash.now[:alert] = "投稿に失敗しました"
  #     render ("items/new")
  #   end
  # end


  private
  
  def item_params
    params.require(:item).permit(:price, :name, :size_id, :weight_id, :shipping_prefecture_id, :tax_id, :shipping_day_id, :processing, :expiration_date_id, :category_id)
  end

end
