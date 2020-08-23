FactoryBot.define do
  factory :product do
    name            { 'AplleWatch' }
    discription     { '最先端の商品です' }
    category        { '7' }
    status          { '3' }
    delivery_chaege { '2' }
    shipping_area   { '3' }
    shipping_day    { '1' }
    price           { '54000' }
  end
end
