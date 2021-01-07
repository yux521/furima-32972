require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての値が存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "itemが空では登録できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "explanationが空では登録できない" do
          @item.explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it "priceが空では登録できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが数字でないと保存できないこと' do
          @item.price = "waaaczv"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceの範囲が、¥300以上でないと保存できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'priceの範囲が、¥9,999,999以下でないと保存できないこと' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "imageが空では登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "category_idが「1」だと登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "quality_idが「1」だと登録できない" do
          @item.quality_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Quality must be other than 1")
        end
        it "shipping_idが「1」だと登録できない" do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping must be other than 1")
        end
        it "area_idが「1」だと登録できない" do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end
        it "shipping_day_idが「1」だと登録できない" do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end
        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end
