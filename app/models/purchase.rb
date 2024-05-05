class Purchase < ApplicationRecord
  has_one :order
  belongs_to :item
  belongs_to :user
end
