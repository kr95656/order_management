class Item < ApplicationRecord
  belongs_to :category                        #カテゴリー
  belongs_to :expiration_date                 #賞味期限
  belongs_to :processing                      #加工日
  belongs_to :user                            #ユーザー

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :shipping_prefecture #産地
  # belongs_to_active_hash :weight              #重量
  # belongs_to_active_hash :size                #サイズ
  # belongs_to_active_hash :shipping_day        #到着までの期間
end
