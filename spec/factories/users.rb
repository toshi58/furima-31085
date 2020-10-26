FactoryBot.define do
  factory :user do
    nickname              { 'タロちゃん' }
    email                 { Faker::Internet.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password              { password }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
