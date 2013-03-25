class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
        if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :action => :show, :id => @current_user[:id]
        end
      else
        redirect_to :controller => :welcome
      end

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
            if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :action => :show, :id => @current_user[:id]
        end
      else
        redirect_to :controller => :welcome
      end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @product.save
    redirect_to :action => :index
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :action => :index
  end


end
