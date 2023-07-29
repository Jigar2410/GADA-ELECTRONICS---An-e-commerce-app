class UpdateForeignKeyCOnstraint < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :order_items, :orders, column: "cart_id", on_delete: :cascade
    remove_foreign_key :orders, :users, on_delete: :cascade
    add_foreign_key :order_items, :orders, column: "cart_id"
    add_foreign_key :orders, :users
  end
end
