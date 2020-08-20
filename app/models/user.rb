class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, :birthday
    validates :email, format: { with: /@./, message: "このメールアドレスは使用できません。"}
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z{6,}/, message: "is invalid. Input full-width characters."}
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width katakana characters."}
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid Input half-width characters."}
  end
end
