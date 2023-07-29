class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, foreign_key: "cart_id", dependent: :destroy, inverse_of: :order
end
