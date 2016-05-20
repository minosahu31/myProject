class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :all_products, only: [:index, :create, :update, :destroy]

  def index
    render json: { success: true, products: @products }
  end

  def show
    render json: { success: true, product: @product }
  end

  def new
    @student = Student.new
    redner json: { success: true, product: @product }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { success:true, products: @products }
    else
      render json: { success:false, product_errors: @product.errors, status: unprocessable_entity }
    end
  end

  def edit
    render json: { success:true, product: @product }
  end

  def update
    if @product.update
      render json: { success:true, products: @products }
    else
      render json: { success:false, product_errors: @product.errors, status: unprocessable_entity }
    end
  end

  def destroy
    if @product.destroy
      render json: { success:true, products: @products }
    else
      render json: { success:false, product_errors: @product.errors, status: unprocessable_entity }
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :price, :quantity)
  end

  def all_products
    @products = Product.all
  end

end
