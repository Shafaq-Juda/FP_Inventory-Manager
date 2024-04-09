# == Schema Information
#
# Table name: vendors
#
#  id           :bigint           not null, primary key
#  contact_info :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#
class Vendor < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :products, class_name: "Product", foreign_key: "vendor_id"

  validates :name, presence: true
  validates :owner, presence: true  # Ensure that the owner is present
end
