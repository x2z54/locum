class BrandsController < ApplicationController
  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
        if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :controller => :welcome
        end
      else
        redirect_to :controller => :welcome
      end

  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @brand = Brand.new
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
        if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :action => :show, :id => @current_user[:id]
        end
      else
        redirect_to :controller => :welcome
      end
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(params[:brand])
    @brand.save
    redirect_to brands_path
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end
end
