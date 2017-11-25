class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all
    render json: JSON.pretty_generate(@orders.as_json)

    # render json: @orders
  end
end
