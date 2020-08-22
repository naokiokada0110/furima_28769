class Product < ApplicationRecord
  has_one :purchase
  belong_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :category
    validates :status
    validates :delivery_charge
    validates :shipping_area
    validates :shipping_day
    validates :price, format: { with: /greater_than_or_equal_to:300, less_than_or_equal_to:9999999/, message:"この金額は入力できません"}
    validates :user
  end
end
