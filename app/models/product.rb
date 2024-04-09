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
#  vendor_name  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  vendor_id    :integer
#
class Product < ApplicationRecord
  # belongs_to :owner, class_name: "User"
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id", optional: true

  has_many_attached :image
  has_many  :orders, class_name: "Order", foreign_key: "product_id", dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :barcode, presence: true
  # validates :owner, presence: true  # Ensure that the owner is present

  def vendor_name=(name)
    # Find the vendor by name
    self.vendor = Vendor.find_by(name: name)
    
    # If vendor not found, create a new one
    self.vendor ||= Vendor.create(name: name)
  end



  # Assuming you have a custom validation for vendor_name presence
  # validates :vendor_name, presence: true, if: -> { vendor_id.blank? }
end
