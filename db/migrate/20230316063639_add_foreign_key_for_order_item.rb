class AddForeignKeyForOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :order_items, :items, on_delete: :cascade
  end
end
