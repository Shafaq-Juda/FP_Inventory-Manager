class RemoveSoldFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :sold, :boolean
  end
end
