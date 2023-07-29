class RemoveColumnFromOrdersnew < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, "payment status", :string
  end
end
