class OrdersController < ApplicationController
  def new
    @order = Order.new
    @profile = Profile.find(params[:profile_id])
    @composition = Composition.where(variants_match: params[:plantId] + ";" + params[:potId]).first
  end

  def index
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @cart = Cart.where(profile_id: params[:profile_id], state: "pending")[0]
    @cart = Cart.create(state:"pending",profile_id: @profile.id) unless @cart
    @order = Order.new(order_params)
    @order.profile = @profile
    @order.cart = @cart
    if @order.save
      @cart.amount_cents += @order.composition.price
      @cart.save
      redirect_to "/"
    else
      render :new
    end
  end

  def show

  end

  def destroy
    @profile = params[:profile_id]
    @cart = Cart.where(profile_id: params[:profile_id], state: "pending")[0]
    @order = Order.find(params[:id])
    @cart.amount_cents -= @order.composition.price
    @cart.save
    @order.destroy
    redirect_to profile_carts_path(@profile)
  end

  private

  def order_params
    params.require(:order).permit(:composition_nickname, :composition_id)
  end
end
