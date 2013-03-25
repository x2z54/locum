class Brand < ActiveRecord::Base
  attr_accessible :title
  has_many :brands_categories
  has_many :categories , :through => :brands_categories
  has_many :products
end
