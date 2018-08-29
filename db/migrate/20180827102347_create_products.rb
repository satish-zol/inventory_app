class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :product_type
      t.string :strings
      t.float :price
      t.string :serial_number, unique: true
      t.datetime :purchased_at
      t.datetime :sold_at

      t.timestamps
    end
  end
end
