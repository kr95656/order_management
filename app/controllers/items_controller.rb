class ItemsController < ApplicationController
  
  def index; end


  #createを設定しているが、機能していない。つまり、create以前で問題点があると考えられる。
  #newコントローラーがおかしいのか？
  #gem関係なのか？
  #rubyのバージョンの問題なのか？
  #次回も、データベースに保存されない原因を追求する。
  def new
    # @product = Form::Product.new
    # @item = Form::Item.new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
  end
  
  def create
    # binding.pry
    params[:item][:processing] = processing_join
    params[:item][:expiration_date] = expiration_date_join
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params
      .require(:item)
      .permit(:price, :name, :size_id, :weight_id, :shipping_prefecture_id, :tax, :shipping_day_id, :processing, :expiration_date) 
  end

  def processing_join
    # パラメータ取得
    date = params[:item][:processing]

    # ブランク時のエラー回避のため、ブランクだったら何もしない
    if date["processing(1i)"].empty? && date["processing(2i)"].empty? && date["processing(3i)"].empty?
      return
    end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["processing(1i)"].to_i,date["processing(2i)"].to_i,date["processing(3i)"].to_i

  end

  def expiration_date_join
    # パラメータ取得
    date = params[:item][:expiration_date]

    # ブランク時のエラー回避のため、ブランクだったら何もしない
    if date["expiration_date(1i)"].empty? && date["expiration_date(2i)"].empty? && date["expiration_date(3i)"].empty?
      return
    end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["expiration_date(1i)"].to_i,date["expiration_date(2i)"].to_i,date["expiration_date(3i)"].to_i

  end


end
