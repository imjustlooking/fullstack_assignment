class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal

  def total_price
    quantity * unit_price
  end
end
