class ChangeDataTypeForOrders < ActiveRecord::Migration[5.2]
  def self.up
    change_column :orders, :total, :decimal, precision: 12, scale: 2
  end

  def self.down
     change_column :orders, :total, :float
  end

end
