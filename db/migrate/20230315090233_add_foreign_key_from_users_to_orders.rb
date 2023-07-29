class AddForeignKeyFromUsersToOrders < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :orders, :users, on_delete: :cascade
  end
end
