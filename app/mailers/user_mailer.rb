class UserMailer < ActionMailer::Base
default :from => "admin@manvel.ru"
  def registration_confirmation(user)
  	@user = user
    mail(:to => user.email, :subject => "Register no-reply")
  end

  def order_confirmation(order)
  	@order = order
  	@total_price = 0
  	@order.line_items.each do |item|
      @total_price += item.product.price 
    end
  	mail(:to => order.email, :subject => "Your order")
  end

  def order_admin(order)
  	@order = order
  	@total_price = 0
  	@order.line_items.each do |item|
      @total_price += item.product.price 
    end
  	mail(:to => "manvel.sant@gmail.com", :subject => "New order")
  end
end
