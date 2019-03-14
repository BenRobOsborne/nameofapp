class AddOrderStatusIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_status_id, :boolean
    
  end
end
