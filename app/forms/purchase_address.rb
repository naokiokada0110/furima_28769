class PurchaseAddress
  
  include ActiveModel::Model
  attr_accessor :user, :product, :post_cord, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user
    validates :product
  end

  POSTCORD_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONENUMBER_REGEX = /0[789]0\d{8}/.freeze

  with_options presence: true do
    validates :post_cord,     format: { with: POSTCORD_REGEX, message: 'ハイフンを使用してください' }
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number,  format: { with: PHONENUMBER_REGEX, message: 'この番号は登録できません' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user, product_id: product)
    ShippingAddress.create(post_cord: post_cord, prefecture_id: prefecture_id, city: city, block: block, phone_number: phone_number, purchase_id: purchase.id)
  end

end