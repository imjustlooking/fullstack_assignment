class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all
    # render json: JSON.pretty_generate(@orders.as_json(:only => [ :order_id, :serving_datetime ]))
    render json: JSON.pretty_generate(@orders.as_json)
  end
  def show
  end
end
