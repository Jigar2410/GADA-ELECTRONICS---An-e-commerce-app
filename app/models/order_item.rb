class OrderItem < ApplicationRecord
  belongs_to :order, foreign_key: "cart_id", inverse_of: :order_items
end
