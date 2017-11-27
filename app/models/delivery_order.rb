class DeliveryOrder < ApplicationRecord
  validates_presence_of :serving_datetime, :order_id
  has_many :order_items
  has_one :feedback, as: :ratable

  def delivery_date
  serving_datetime.to_time.strftime('%Y-%m-%d') unless serving_datetime.nil?
  end
  def delivery_time
  (serving_datetime-30*60).to_time.strftime('%l:%M')+'-'+serving_datetime.to_time.strftime('%l:%M %p') unless serving_datetime.nil?
  end
  def feedback_submitted
    self.feedback ? true : false
  end
end
