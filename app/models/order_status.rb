class OrderStatus < ActiveRecord::Base
  has_many :orders

  def set_order_status
    self.order_status_id = 1
  end



end
