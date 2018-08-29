class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :name
      t.string :accessory_type
      t.float :price
      
      t.timestamps
    end
  end
end
