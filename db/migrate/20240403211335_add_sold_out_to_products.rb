class AddSoldOutToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sold, :boolean
  end
end