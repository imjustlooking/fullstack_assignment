class OrderItem < ApplicationRecord
  validates_presence_of :quantity, :unit_price
  belongs_to :delivery_order
  belongs_to :meal
  has_one :feedback, as: :ratable

  def total_price
    quantity * unit_price
  end
  def name
    self.meal.name
  end
  def order_item_id
    self.meal.id
  end
end
