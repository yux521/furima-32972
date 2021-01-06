class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :item
    validates :explanation
    validates :category_id
    validates :quality_id
    validates :price
    validates :shipping_id
    validates :area_id
    validates :shipping_day_id
    validates :user_id
  end
  
  #ジャンルの選択が「--」の時は保存できない
  validates :genre_id, numericality: { other_than: 1 }

  #アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :shipping
  belongs_to :area
  belongs_to :shipping_day
end
