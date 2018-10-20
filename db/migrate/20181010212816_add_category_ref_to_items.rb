class AddCategoryRefToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, foreign_key: true, null: false
    add_reference :items, :brand, foreign_key: true
    add_reference :items, :size, foreign_key: true
    add_reference :items, :area, foreign_key: true, null: false
    add_column :items, :condition, :integer, null: false
    add_column :items, :shipping_payer, :integer, null: false
    add_column :items, :shipping_method, :integer, null: false
    add_column :items, :days_to_ship, :integer, null: false
    add_column :items, :trading_status, :integer, null: false, default: 0
    add_column :items, :shipping_fee, :integer
  end
end
