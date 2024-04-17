FactoryBot.define do
  factory :item do
    product_name         { 'テスト' }
    product_description  { 'テストのための商品です' }
    product_category_id  { '2' }
    product_status_id    { '2' }
    shipping_fee_id      { '2' }
    shipping_area_id     { '2' }
    delivery_time_id     { '2' }
    product_price        { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
