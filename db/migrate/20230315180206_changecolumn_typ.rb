class ChangecolumnTyp < ActiveRecord::Migration[7.0]
  def change
    change_column :order_items, :cart_id, :string
  end
end
