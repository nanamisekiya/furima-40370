class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :delivery_time

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_time_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_price, presence: true

end
