class CartProduct < ActiveRecord::Base
  belongs_to :cart_id, :product_id
end
