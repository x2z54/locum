class BrandsCategory < ActiveRecord::Base
   attr_accessible :brand_id, :category_id
   belongs_to :brand
   belongs_to :category
end
