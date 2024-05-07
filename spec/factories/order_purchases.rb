FactoryBot.define do
  factory :order_purchase do
    post_code         { '111-1111' }
    shipping_area_id  { '2' }
    city              { '品川区' }
    block             { '荏原' }
    building          { 'マンンション101' }
    phone_number      { '09011111111' }
  end
end
