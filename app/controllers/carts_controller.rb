class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  helper_method :current_or_guest_user
  def index
    @orders = []
    @profile = Profile.find(params[:profile_id])
    @cart = Cart.where(profile_id: params[:profile_id], state: "pending")[0]
    @orders = @cart.orders if @cart
  end

  def show
    @cart = Cart.find(params[:id])
    @orders = @cart.orders
  end
end
