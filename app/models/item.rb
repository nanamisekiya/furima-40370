class Item < ApplicationRecord
  belongs_to :user

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_category_id, presence: true
  validates :product_status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_area_id, presence: true
  validates :delivery_time_id, presence: true
  validates :product_price, presence: true
end
