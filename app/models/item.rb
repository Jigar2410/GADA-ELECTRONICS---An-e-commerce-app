# This is Item model
class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :price, comparison: { greater_than_or_equal_to: 0 }
  validates :quantity, comparison: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 300 }
end
