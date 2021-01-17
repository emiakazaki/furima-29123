FactoryBot.define do
  factory :item do
    product_name          {'ノートパソコン'}
    text                  {'2020年に10月に購入した、MacbookProです'}
    price                 {120000}
    fee_id                { 2 }
    state_id              { 3 }
    category_id           { 2 }
    prefecture_id         { 1 }
    scheduled_delivery_id { 1 }
    user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/factories/images/test_image.png'), filename: 'test_image.png')
    end
  end
 end