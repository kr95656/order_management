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
  #     redirect_to root_path
  #   else
  #     render :new
  #     binding.pry
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:price, :name, :tax)
  end
  
end


# From: /Users/kamimura/order/order_management/app/controllers/items_controller.rb:10 ItemsController#create:

#      9: def create
#  => 10:   binding.pry
#     11:   @item = Item.new(item_params)
#     12:   if @item.save
#     13:     redirect_to root_path
#     14:   else
#     15:     render :new
#     16:   end
#     17: end

# [1] pry(#<ItemsController>)> params
# => <ActionController::Parameters {"authenticity_token"=>"9p8+RPmZJslyKamdDh1r4rky25vNJR7K5jYZXyd9jq0Y8Reh56Yd72CMgmjYNaWaGSgdDgyCpARFFvLW1FODag==", "item"=>{"name"=>"fff", "tax"=>"1", "price"=>"-1"}, "commit"=>"送信", "controller"=>"items", "action"=>"create"} permitted: false>
# [2] pry(#<ItemsController>)> item_params
# => <ActionController::Parameters {"price"=>"-1", "name"=>"fff", "tax"=>"1"} permitted: true>
# [3] pry(#<ItemsController>)> 

