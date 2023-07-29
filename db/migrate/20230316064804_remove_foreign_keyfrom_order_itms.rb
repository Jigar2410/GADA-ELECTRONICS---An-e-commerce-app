class RemoveForeignKeyfromOrderItms < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :order_items, :orders
  end
end
