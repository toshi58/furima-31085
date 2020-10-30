FactoryBot.define do
  factory :order_shipping do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '東京都' }
    address       { '1-1' }
    building      { '建物' }
    phone_number  { '09012345678' }
  end
end
