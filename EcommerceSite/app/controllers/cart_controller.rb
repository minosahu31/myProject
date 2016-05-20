class CartController < ApplicationController

  def create
    @cart = Cart.new(params[:user_id])
    if @cart.save
      render json: { success: true, @cart: @cart }
    else
      render json: { success: false, cart_errors:@cart.errors, status: unprocessable_entity }
    end
  end

end
