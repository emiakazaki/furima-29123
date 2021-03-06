class Fee < ActiveHash::Base

  self.data = [
               {id: 0, name: '---'},
               {id: 1, name: '着払い(購入者様負担)'},
               {id: 2, name: '送料込み(出品者様負担)'}
              ]

  include ActiveHash::Associations
  has_many :items
end
