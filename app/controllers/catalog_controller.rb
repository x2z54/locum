class CatalogController < ApplicationController
layout "category", only: :brand

	def index
		@category = Category.all
    		@products = @category.paginate(:per_page => 1, :page => params[:page])
	end

	def brand
		@category = Category.find(params[:category_id])
		@brand = Brand.find(params[:brand_id])
		@products = Product.where(category_id: params[:category_id], brand_id: params[:brand_id]).includes([:category,:brand]).all(:order=>'price')
	end

end
