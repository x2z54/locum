class ApplicationController < ActionController::Base
  protect_from_forgery

 before_filter :get_categories

  def get_categories
  	@categories = Category.includes(:brands)
  end



  private
def current_cart
Cart.find(session[:cart_id])
rescue ActiveRecord::RecordNotFound
cart = Cart.create
session[:cart_id] = cart.id
cart
end

end
