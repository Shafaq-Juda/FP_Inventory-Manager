class RemoveOwnerIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :product, :owner_id, :integer
  end
end
