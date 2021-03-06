class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string        :name, null: false                                          #商品名
      t.integer       :tax, null: false                                           #税金
      t.integer       :price, null: false                                         #価格
      t.integer       :size_id, null: false                                       #サイズ
      t.integer       :weight_id, null: false                                     #重量
      t.integer       :shipping_prefecture_id, null: false                        #産地
      t.integer       :shipping_day_id, null: false                               #到着までの期間 
      t.date          :processing, null: false                                    #加工日
      t.date        :expiration_date, null: false                                 #賞味期限
      # t.references :category, null: false, foreign_key: true                  #カテゴリー
      t.timestamps
    end
  end
end
