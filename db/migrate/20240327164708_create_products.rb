class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :price
      t.integer :vendor_id
      t.integer :quantity, default: 0
      t.string :barcode
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
