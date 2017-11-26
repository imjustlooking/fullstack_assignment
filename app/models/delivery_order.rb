class DeliveryOrder < ApplicationRecord
  validates_presence_of :serving_datetime
  validates_presence_of :order_id
  has_many :order_items
  # def as_json(options={})
  #   super(include: { order_items: {
  #                          include: { meal: {
  #                                         only: :name } },
  #                          only: [:quantity, :unit_price] } },
  #         only: [:order_id],
  #         methods: [:delivery_date, :delivery_time])
  # end
  def delivery_date
  serving_datetime.to_time.strftime('%Y-%m-%d') unless serving_datetime.nil?
  end
  def delivery_time
  serving_datetime.to_time.strftime('%l:%M %p') unless serving_datetime.nil?
  end
end
