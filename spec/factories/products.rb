FactoryBot.define do
  factory :product do
    name               { 'AplleWatch' }
    discription        { '最先端の商品です' }
    category_id        { '1' }
    status_id          { '1' }
    delivery_chaege_id { '1' }
    shipping_area_id   { '1' }
    shipping_day_id    { '1' }
    price              { '54000' }
    association :user
  end
end
