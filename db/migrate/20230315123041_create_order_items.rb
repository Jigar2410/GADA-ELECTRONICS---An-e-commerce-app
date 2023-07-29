class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer "cart_id"
      t.integer "item_id"
      t.integer "item_quantity"
      t.integer "item_total_price"
      t.timestamps
    end
  end
end
