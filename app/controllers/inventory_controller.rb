class InventoryController < ApplicationController

  def index
    @products = Product.where(owner_id: current_user.id).order(created_at: :desc)
  
    render {:index}
  end

end
