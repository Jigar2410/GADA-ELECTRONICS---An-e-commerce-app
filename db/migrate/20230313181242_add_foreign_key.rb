class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :user_id, :bigint
    add_foreign_key :items, :users, column: :user_id
  end
end
