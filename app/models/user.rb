class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :order
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: "には英字と数字の両方を含めて設定してください。"}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"} do
    validates :firstname
    validates :lastname
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"} do
    validates :first_name_kana
    validates :last_name_kana
  end
end
end