class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.text :adress
      t.string :name
      t.string :surname
      t.decimal :index
      t.string :phone

      t.timestamps
    end
  end
end
