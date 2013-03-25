class RemovePartNumberFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :category
    remove_column :products, :brand
  end

  def down
    add_column :products, :brand, :string
    add_column :products, :category, :string
  end
end
