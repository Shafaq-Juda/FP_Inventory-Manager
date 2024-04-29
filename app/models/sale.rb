# == Schema Information
#
# Table name: sales
#
#  id            :bigint           not null, primary key
#  quantity_sold :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id    :integer
#
class Sale < ApplicationRecord
  belongs_to :product, required: true, class_name: "Product", foreign_key: "product_id", counter_cache: true
end
