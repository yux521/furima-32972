class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :item
    validates :explanation
    validates :category_id
    validates :quality_id
    validates :price
    validates :shipping_day_id
    validates :area_id
    validates :image
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :shipping_day_id
    validates :area_id
  end
  #アソシエーション
  belongs_to :user
  has_one_attached :image
  #ActiveHashアソシエーション
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping
  belongs_to :area
  belongs_to :shipping_day
end
