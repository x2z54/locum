class CreateBrandsCategories < ActiveRecord::Migration
  def change
    create_table :brands_categories do |t|
      t.integer :brand_id
      t.integer :category_id
      t.timestamps
    end
  end
end
