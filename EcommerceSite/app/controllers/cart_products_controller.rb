class CartProductsController < ApplicationController

  before_action: find_cart_product, only: [:show, :destroy]

  def index
    @cart_products = CartProduct.all
    render json: { success: true, cart_products: @cart_products }
  end

  def show
    render json: { success: true, cart_product: @cart_product }
  end

  def create
    @cart_product = Cartproduct.new(cart_product_params)
    if @cart_product.save
      render json: { success: true, cart_product: @cart_product }
    else
      render json: { success: false, cart_product_errors: @cart_product.errors, status: unprocessable_entity }
    end
  end

  def destroy
    if @cart_product.destory
      @cart_products = CartProduct.all
      render json: { success: true, cart_products: @cart_products }
    end
  end

  private

  def find_cart_product
    @cart_product = CartProduct.find(params[:id])
  end

  def cart_product_params
    params.require(:cart_id, :product_id)
  end

end
