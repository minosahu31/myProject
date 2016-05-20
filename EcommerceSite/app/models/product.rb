class Product < ActiveRecord::Base
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products
end
