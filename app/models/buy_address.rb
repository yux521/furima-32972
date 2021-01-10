class BuyAddress < ActiveHash::Base
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :number, :building, :tel, :item_id, :user_id


  # バリデーション
  with_options presence: true do
    # 郵便番号（ハイフンあり7桁）
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    # 市町村
    validates :municipalities
    # 番地
    validates :number
    # 電話番号(ハイフンなし11桁以下)
    validates :tel, format: { with: /\A\d{,11}\z/ }
  end
    # 都道府県
    validates :area_id, numericality: { other_than: 1 }
  
    def save
    # 購入記録の情報を保存
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所発送先の情報を保存
    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, number: number, building: building, tel: tel, buy_id: buy.id)
  end
end