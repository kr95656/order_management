class ItemsController < ApplicationController
  
  def index; end


  #createを設定しているが、機能していない。つまり、create以前で問題点があると考えられる。
  #newコントローラーがおかしいのか？
  #gem関係なのか？
  #rubyのバージョンの問題なのか？
  #次回も、データベースに保存されない原因を追求する。
  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
  end
  
  def create

    params[:item][:processing_id][:expiration_date_id] = birthday_join
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
    params.require(:item).permit(:price, :name, :size_id, :weight_id, :shipping_prefecture_id, :tax, :shipping_day_id, :processing_id, :expiration_date_id, :category_id) 
  end

  def birthday_join
    # パラメータ取得
    date = params[:item][:processing_id][:expiration_date_id]

    # ブランク時のエラー回避のため、ブランクだったら何もしない
    if date["processing_id(1i)"].empty? && date["processing_id(2i)"].empty? && date["processing_id(3i)"].empty? && date["expiration_date_id(1i)"].empty? && date["expiration_date_id(2i)"].empty? && date["expiration_date_id(3i)"].empty?
      return
    end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["processing_id(1i)"].to_i, date["processing_id(2i)"].to_i, date["processing_id(3i)"].to_i, date["expiration_date_id(1i)"].to_i, date["expiration_date_id(2i)"].to_i, date["expiration_date_id(3i)"].to_i

  end


end
