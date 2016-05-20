class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :destory]

  def index
    @orders = Order.all
    render json: { success: true, orders: @orders }
  end

  def show
    render json: { success: true, order: @order }
  end

  def new
    @order = Order.new
    redner json: { success: true, order: @order }
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: { success: true, order: @order }
    else
      render json: { success: false, order_errors: @order.errors ,status: unprocessable_entity }
    end
  end

  def destroy
    if @order.destroy
      @orders = Order.all
      render json: { success: true, orders: @orders }
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:cart_id)
  end

end
