class User < ApplicationRecord
  # has_many :items
  has_one :card       #主語がhas_one で受け身になる方がbelongs_toになる
end
