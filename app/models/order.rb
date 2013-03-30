class Order < ActiveRecord::Base
  attr_accessible :adress, :email, :index, :name, :phone, :surname, :status, :pay, :order_type, :comment, :User_order
  has_many :line_items, :dependent => :destroy
  def add_line_items_from_cart(cart)
cart.line_items.each do |item|
item.cart_id = nil
line_items << item
end
end

end
