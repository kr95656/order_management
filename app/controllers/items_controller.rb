class ItemsController < ApplicationController
  
  def index; end

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
    params.require(:item).permit(:price)
  end

end
