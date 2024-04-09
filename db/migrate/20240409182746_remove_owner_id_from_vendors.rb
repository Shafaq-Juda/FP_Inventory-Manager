class RemoveOwnerIdFromVendors < ActiveRecord::Migration[7.0]
  def change
    remove_column :vendor, :owner_id, :integer
  end
end
