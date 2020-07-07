class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false                                       #商品名
      t.string :size_id, null: false                                    #サイズ
      t.integer :price, null: false                                     #価格
      t.float :weight_id, null: false                                   #重量
      t.integer :shipping_prefecture_id, null: false                    #産地
      t.integer :tax, null: false                                       #税金
      t.references :processing, null: false, foreign_key: true          #加工日
      t.references :shipping_day, null: false, foreign_key: true        #到着までの期間 
      t.references :expiration_date, null: false, foreign_key: true     #賞味期限
      # t.references :category, null: false, foreign_key: true            #カテゴリー
      t.timestamps
    end
  end
end
