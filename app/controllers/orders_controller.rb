class OrdersController < ApplicationController
  def all
    @orders = DeliveryOrder.all
    render json: JSON.pretty_generate(:orders => @orders.as_json(:only => [:order_id], methods: [:delivery_date, :delivery_time]))
  end
  def show
    @order = DeliveryOrder.where(:order_id=>params[:order_id].upcase)
    @items = OrderItem.where(:delivery_order_id=>@order.ids)
    render json: JSON.pretty_generate(:order => @order.as_json(include: { order_items: {
                                                                          only: [:quantity],
                                                                          methods: [:total_price, :name] } },
                                                              only: [:order_id],
                                                              methods: [:delivery_date, :delivery_time]))
  end
  def index
  end
end
