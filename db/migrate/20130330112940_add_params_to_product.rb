class AddParamsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :article, :string
    add_column :products, :collection, :string
  end
end
