class AddUserOrderToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :User_order, :decimal
  end
end
