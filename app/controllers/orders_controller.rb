class OrdersController < ApplicationController
  def all
    @orders = DeliveryOrder.all.sort_by {|u| u.serving_datetime}
    render json:
    JSON.pretty_generate(
      :orders => @orders.as_json(
        :only => [:order_id],
        methods: [:delivery_date, :delivery_time, :feedback_submitted]
        ))
  end
  def show
    @order = DeliveryOrder.where(:order_id=>params[:order_id].upcase)
    @items = OrderItem.where(:delivery_order_id=>@order.ids)
    render json:
    JSON.pretty_generate(
      :order => @order.as_json(
        include: {order_items: {
                            only: [:quantity],
                            methods: [:total_price, :name]
                            }},
                  only: [:order_id],
                  methods: [:delivery_date, :delivery_time]
                  ))
  end
  def index
  end
  def feedback
    @order = DeliveryOrder.where(:order_id=>params[:order_id].upcase)
    @items = OrderItem.where(:delivery_order_id=>@order.ids)

    @combineID = @items.ids + @order.ids

    @feedbacks = Feedback.where(:ratable_id => @combineID)
    render json: JSON.pretty_generate(
      :feedbacks => @feedbacks.as_json
    )
  end
end
