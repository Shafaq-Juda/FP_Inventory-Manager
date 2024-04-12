class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price, default: 0
      t.integer :vendor_id
      t.integer :quantity, default: 0
      t.string :barcode
      t.integer :orders_count

      t.timestamps
    end
  end
end
