class AddParamesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :type, :string
    add_column :orders, :pay, :string
  end
end
