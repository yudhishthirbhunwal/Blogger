class AddNullToCategory < ActiveRecord::Migration[7.0]
  def change
    change_column :microposts, :category, :integer, null: false
  end
end
