class AddPartNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :brand, :string
    add_column :products, :category, :string
  end
end
