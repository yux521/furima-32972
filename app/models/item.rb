class Item < ApplicationRecord
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

  belongs_to :user
  has_one_attached :image
end
