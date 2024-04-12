class ChangeProductsOrderCountToSalesCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :orders_count, :sales_count
  end
end
