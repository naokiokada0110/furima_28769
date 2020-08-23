FactoryBot.define do
  factory :user do
    nickname              { 'kinta' }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '金太郎' }
    first_name            { '山田' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'キンタロウ' }
    birthday              { Faker::Date.birthday }
  end
end
