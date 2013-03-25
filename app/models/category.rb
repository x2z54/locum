class Category < ActiveRecord::Base
  attr_accessible :title 
  has_many :brands_categories
  has_many :brands, :through => :brands_categories
  has_many :products
end
