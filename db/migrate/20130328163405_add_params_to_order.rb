class AddParamsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :type, :string
    add_column :orders, :comment, :text
    add_column :orders, :pay, :string
  end
end
