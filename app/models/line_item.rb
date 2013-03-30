class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :product
  belongs_to :order
  belongs_to :product
  belongs_to :cart

end
