class AddVendorNameToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :vendor_name, :string
  end
end
