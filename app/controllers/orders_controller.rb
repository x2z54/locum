class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order("id").page(params[:page]).per(5)
if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :controller => :welcome
        end
      else
        redirect_to :controller => :welcome
      end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @total_price = 0
    @order.line_items.each do |item|
      @total_price += item.product.price 
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @user = User.find(session[:user_id])
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to :controller => :carts, :action => :show, :id => @cart.id
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = User.find(session[:user_id])
    @order = Order.new(params[:order])
    @order[:User_order] = @user[:id]
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      UserMailer.order_confirmation(@order).deliver
      UserMailer.order_admin(@order).deliver
      render "_good"
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    redirect_to orders_path
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
