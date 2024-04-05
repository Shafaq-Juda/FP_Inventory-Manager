class InventoryController < ApplicationController

  def index
    @products = Product.where(owner_id: current_user.id).order(created_at: :desc)
  
    render {:index}
  end

  def sold
    # render {:sold}
    @products = Product.where(owner_id: current_user.id).order(created_at: :desc)
    
    product.sold == false
    redirect_to inventory_sold_path
  end
end
