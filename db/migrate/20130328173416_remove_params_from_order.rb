class RemoveParamsFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :pay
    remove_column :orders, :type
  end

  def down
    add_column :orders, :type, :string
    add_column :orders, :pay, :string
  end
end
