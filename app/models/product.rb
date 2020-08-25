class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_chaege
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :discription
    validates :category_id
    validates :status_id
    validates :delivery_chaege_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'この金額は入力できません' }
    validates :user
  end
end
