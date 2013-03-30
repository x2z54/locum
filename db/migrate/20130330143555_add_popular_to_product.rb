class AddPopularToProduct < ActiveRecord::Migration
  def change
    add_column :products, :popular, :boolean
  end
end
