# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  barcode      :string
#  description  :text
#  name         :string
#  orders_count :integer
#  price        :integer          default(0)
#  quantity     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  vendor_id    :integer
#
class Product < ApplicationRecord
  
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id", optional: true

  has_many_attached :image
  has_many  :orders, class_name: "Order", foreign_key: "product_id", dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :barcode, presence: true
  
  
end
