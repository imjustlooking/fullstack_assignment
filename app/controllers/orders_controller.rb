class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def all
    @orders = DeliveryOrder.all.sort_by {|u| u.serving_datetime}
    render json:
    JSON.pretty_generate(
      :orders => @orders.as_json(
        :only => [:id, :order_id],
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
                            methods: [:order_item_id, :total_price, :name]
                            }},
                  only: [:id, :order_id],
                  methods: [:delivery_date, :delivery_time]
                  ))
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
  def add
    @order = DeliveryOrder.where(:order_id=>params[:order_id].upcase)
    @items = OrderItem.where(:delivery_order_id=>@order.ids)
    p 'json received'
    p params
  end
end
