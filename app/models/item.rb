class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できない
  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :image
  end

  #ジャンルの選択が「--」の時は保存できない
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :shipping_id
    validates :area_id
    validates :shipping_day_id
  end

  validates :price, numericality: { only_integer: true}
  validates :price, inclusion: { in: 300..9_999_999 }

  #アソシエーション
  belongs_to :user
  has_one :buy
  has_one_attached :image

  #ActiveHashアソシエーション
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping
  belongs_to :area
  belongs_to :shipping_day
end
