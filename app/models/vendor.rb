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
end
