class ChangePrimaryKeyTypeInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :id, :string
  end
end
