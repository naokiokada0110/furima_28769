class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z{6,}/.freeze
  EMAIL_REGEX = /@./.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, :birthday
    validates :email, format: { with: EMAIL_REGEX, message: 'このメールアドレスは使用できません。' }
    validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: NAME_KANA_REGEX, message: 'is invalid Input half-width characters.' }
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: 'is invalid Input half-width characters.' }
  end
end
