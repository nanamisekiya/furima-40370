class OrderPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :block, :building, :phone_number, :purchase_record_id
  with_options presence: true do
    validates :purchase_record_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
  end
end
