class DeliveryOrder < ApplicationRecord
  has_many :order_items
  def as_json(options={})
  {order_id: order_id}.tap do |hash|
    hash[:delivery_date] = serving_datetime.to_time.strftime('%Y-%m-%d') unless serving_datetime.nil?
    hash[:delivery_time] = serving_datetime.to_time.strftime('%l:%M %p') unless serving_datetime.nil?
  end
  end
end
