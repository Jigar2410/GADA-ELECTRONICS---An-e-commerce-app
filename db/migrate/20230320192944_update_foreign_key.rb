class UpdateForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :order_items, :items, on_delete: :cascade
    add_foreign_key :order_items, :items
  end
end
