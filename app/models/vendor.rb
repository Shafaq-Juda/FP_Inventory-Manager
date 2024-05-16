# == Schema Information
#
# Table name: vendors
#
#  id           :bigint           not null, primary key
#  contact_info :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Vendor < ApplicationRecord
  has_many :products, class_name: "Product", foreign_key: "vendor_id"

  validates :name, presence: true
end
