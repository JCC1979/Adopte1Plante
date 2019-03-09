class CartsController < ApplicationController
  def index
    @orders = []
    @profile = params[:profile_id]
    @cart = Cart.where(profile_id: params[:profile_id], state: "pending")[0]
    @orders = @cart.orders if @cart
  end

  def show
    
  end
end
