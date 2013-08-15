class Product < ActiveRecord::Base
  has_attached_file :avatar
  attr_accessible :title, :brand_id, :category_id, :description, :image_url, :price, :avatar, :article, :collection, :popular
  belongs_to :brand
  belongs_to :category

default_scope :order => 'price'
has_many :line_items

def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    scoped
  end
end

#...
private
# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
if line_items.empty?
return true
else
errors.add(:base, 'Line Items present')
return false
end
end

end
