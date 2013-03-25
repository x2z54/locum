class RemovePartNumberFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :phone
  end

  def down
    add_column :users, :phone, :decimal
  end
end
