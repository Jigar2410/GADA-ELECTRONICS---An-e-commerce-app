class RemoveColumnFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :items, :users, on_delete: :cascade
    remove_column :items, :user_id, :string
  end
end
