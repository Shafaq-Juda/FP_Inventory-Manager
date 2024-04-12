json.extract! sale, :id, :product_id, :quantity_sold, :created_at, :updated_at
json.url sale_url(sale, format: :json)
