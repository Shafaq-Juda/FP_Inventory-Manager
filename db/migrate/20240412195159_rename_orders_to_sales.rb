class RenameOrdersToSales < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        rename_table :orders, :sales
      end
      dir.down do
        rename_table :sales, :orders
      end
    end
  end
end
