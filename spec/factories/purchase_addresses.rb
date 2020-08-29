FactoryBot.define do
  factory :purchase_address do
    post_cord     { '465-0001' }
    prefecture_id { '1' }
    city          { '名古屋市' }
    block         { '栄55' }
    building      { 'エトワール栄' }
    phone_number  { '09087654321' }
    token         { 'token' }
    association :user
    association :product
  end
end
