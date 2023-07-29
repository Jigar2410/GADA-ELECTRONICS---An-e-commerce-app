class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer "user_id"
      t.integer "total_amount"
      t.string "payment status"
      t.timestamps
    end
  end
end
