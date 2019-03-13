class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :subtotal, :decimal, precision: 12, scale: 2
    add_column :orders, :tax, :decimal, precision: 12, scale: 2
    add_column :orders, :shipping, :decimal, precision: 12, scale: 2
  end
end
