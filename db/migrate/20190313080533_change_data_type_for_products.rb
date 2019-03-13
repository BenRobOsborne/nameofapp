class ChangeDataTypeForProducts < ActiveRecord::Migration[5.2]
  def self.up
    change_column :products, :price, :decimal, precision: 12, scale: 2
  end

  def self.down
     change_column :products, :price, :decimal
  end
end
