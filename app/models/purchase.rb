class Purchase < ApplicationRecord
  has_one :shipping_address
  belongs_to :user
  belongs_to :product

  POSTCORD_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONENUMBER_REGEX = /0[789]0\d{8}/.freeze

  with_options presence: true do
    validates :post_cord,     format: { with: POSTCORD_REGEX, message: 'ハイフンを使用してください' }
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number,  format: { with: PHONENUMBER_REGEX, message: 'この番号は登録できません' }
    validates :purchase
  end
end
