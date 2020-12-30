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
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: "には英字と数字の両方を含めて設定してください。"}
  end
end
