class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
        if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :controller => :welcome
        end
      else
        redirect_to :controller => :welcome
      end

  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
        @category = Category.find(params[:id])
        if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        if @current_user[:role] != "Admin"
          redirect_to :action => :show, :id => @current_user[:id]
        end
      else
        redirect_to :controller => :welcome
      end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
    @category.save
    redirect_to categories_path
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to categories_path
      end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
