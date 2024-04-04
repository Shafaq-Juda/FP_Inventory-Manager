# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  barcode     :string
#  description :text
#  name        :string
#  price       :integer          default(0)
#  quantity    :integer          default(0)
#  vendor_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :bigint           not null
#  vendor_id   :integer
#
# Indexes
#
#  index_products_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Product < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :vendor, class_name: "Vendor", optional: true

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :barcode, presence: true
  validates :owner, presence: true  # Ensure that the owner is present

  def vendor_name=(name)
    # Find the vendor by name
    self.vendor = Vendor.find_by(name: name)
    
    # If vendor not found, create a new one
    self.vendor ||= Vendor.create(name: name)
  end



  # Assuming you have a custom validation for vendor_name presence
  # validates :vendor_name, presence: true, if: -> { vendor_id.blank? }
end
