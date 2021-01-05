require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての値が存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上であれば登録できる" do
          @user.password = "2jhdw3"
          @user.password_confirmation = "2jhdw3"
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailに＠がないと登録できない" do
          @user.email = "gdrgd.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下では登録できない" do
          @user.password = "00000"
          @user.password_confirmation = "00000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが全角では登録できないこと" do
          @user.password = "gwg３rdj"
          @user.password_confirmation = "gwg３rdj"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが数字のみでは登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが英語のみでは登録できないこと" do
          @user.password = "dfhncd"
          @user.password_confirmation = "dfhncd"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "nicknameが空では登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "lastnameが空だと登録できない" do
          @user.lastname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname can't be blank")
        end
        it "firstnameが空だと登録できない" do
          @user.firstname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname can't be blank")
        end
        it "lastname_kanaが空だと登録できない" do
          @user.lastname_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
        end
        it "lastname_kanaが半角カナ文字だと登録できない" do
          @user.lastname_kana = 'ﾔﾏﾀﾞ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname kana is invalid")
        end
        it "firstname_kanaが空だと登録できない" do
          @user.firstname_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
        end
        it "firstname_kanaが半角カナ文字だと登録できない" do
          @user.firstname_kana = 'ﾔﾏﾀﾞ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname kana is invalid")
        end
        it "birthdayが空だと登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
   end
end
