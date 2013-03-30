class CatalogController < ApplicationController


	def index
		@products = Product.order("id").page(params[:page]).per(2)
	end

	def brand
		@category = Category.find(params[:category_id])
		@brand = Brand.find(params[:brand_id])
		@products = Product.where(category_id: params[:category_id], brand_id: params[:brand_id]).includes([:category,:brand]).all
	end

end
