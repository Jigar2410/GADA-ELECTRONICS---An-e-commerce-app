class Addforeign < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :order_items, :orders, column: :cart_id, primary_key: "id"
  end
end
