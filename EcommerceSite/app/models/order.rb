class Order < ActiveRecord::Base
  belongs_to :cart_id
end
