class OrderPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :block, :building, :phone_number, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :user_id
    validates :item_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Order.create(post_code:, shipping_area_id:, city:, block:, building:,
                 phone_number:, purchase_id: purchase.id)
  end
end
