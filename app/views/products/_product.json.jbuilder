json.extract! product, :id, :name, :description, :image, :price, :vendor_id, :quantity, :barcode, :user_id_id, :created_at, :updated_at
json.url product_url(product, format: :json)
