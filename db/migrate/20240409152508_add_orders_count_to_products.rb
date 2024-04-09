class AddOrdersCountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :orders_count, :integer
  end
end
