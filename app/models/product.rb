# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  barcode     :string
#  description :text
#  image       :string
#  name        :string
#  price       :integer
#  quantity    :integer          default(0)
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
  belongs_to :vendor, class_name: "Vendor"

  validates :name, presence: true
  validates :description, presence: true
  validates :vendor_name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :barcode, presence: true
end
