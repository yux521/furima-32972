class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end


  # ユーザー本名の正規表現
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
    validates :lastname
    validates :firstname
  end
  
  # ユーザー本名（カナ）の正規表現
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :lastname_kana
  validates :firstname_kana
  end

  # パスワード（半角英数字混合）の正規表現
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password , with: PASSWORD_REGEX

end
