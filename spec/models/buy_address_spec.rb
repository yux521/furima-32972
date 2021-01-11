require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe BuyAddress do
    before do
      @buy_address= FactoryBot.build(:buy_address)
    end
  
    describe '商品購入履歴登録' do
      context '購入履歴の登録がうまくいくとき' do
        it "全ての値が存在すれば登録できる" do
          expect( @buy_address ).to be_valid
        end
      end

      context '購入履歴の登録がうまくいかないとき' do
        it "postal_codeが空では登録できない" do
          @buy_address.postal_code = ""
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it "postal_codeが「-」がないと登録できない" do
          @buy_address.postal_code = "0000000"
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
        end
        it 'postal_codeが半角英数字混合では保存できないこと' do
          @buy_address.postal_code = "2j1-k1h1"
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
        end
        it 'postal_codeが全角では保存できないこと' do
          @buy_address.postal_code = "１２３-４５６７"
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
        end
        it "municipalitiesが空では登録できない" do
          @buy_address.municipalities= ""
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it "numberが空では登録できない" do
          @buy_address.number= ""
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Number can't be blank")
        end
        it "telが空では登録できない" do
          @buy_address.tel= ""
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
        end
        it 'telの範囲が、11桁以下でないと保存できないこと' do
          @buy_address.tel = 100000000000
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Tel is invalid")
        end
        it 'telが「-」なしでないと保存できないこと' do
          @buy_address.tel = "090-11-1111"
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Tel is invalid")
        end
        it 'telが半角英数字混合では保存できないこと' do
          @buy_address.tel = "2j1k1h1jh3s"
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Tel is invalid")
        end
        it 'telが全角では保存できないこと' do
          @buy_address.tel = "１２３４５６７８９１１"
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Tel is invalid")
        end
        it "area_idが「1」だと登録できない" do
          @buy_address.area_id = 1
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Area must be other than 1")
        end
        it "tokenが空では登録できないこと" do
          @buy_address.token = nil
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
