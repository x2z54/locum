class AddBrandAndCategoryToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :category_id, :integer
  	add_column :products, :brand_id, :integer
  end
end
