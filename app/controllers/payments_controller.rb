class PaymentsController < ApplicationController
  before_action :set_order
  helper_method :current_or_guest_user
  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )
  
    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @cart.amount_cents,
      description:  "Payment plant #{@cart.id} for order #{@cart.id}",
      currency:     @cart.amount.currency
    )
  
    @cart.update(payment: charge.to_json, state: 'paid')
    redirect_to profile_path(@profile)
  
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

private

  def set_order
    @cart = Cart.find(params[:cart_id])
    @profile = Profile.find(params[:profile_id])
  end
end
