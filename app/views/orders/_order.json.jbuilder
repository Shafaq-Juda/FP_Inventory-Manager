json.extract! order, :id, :product_id, :quantity_sold, :created_at, :updated_at
json.url order_url(order, format: :json)
