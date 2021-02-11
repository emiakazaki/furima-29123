FactoryBot.define do
  factory :user_order do
    postal_code       {'111-1111'}
    prefecture_id     { 3 }
    municipality      {'渋谷区'}
    address           {'青山1-1-1'}
    building_name     {'渋谷ビル'}
    tel               {'0000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
