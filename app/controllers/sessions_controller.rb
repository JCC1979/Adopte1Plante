class SessionsController < Devise::SessionsController
  helper_method :current_or_guest_user
  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    create_new_order
    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  private

  def create_new_order
    @profile = Profile.find(current_user.id)
    @cart = Cart.where(profile_id: @profile.id, state: "pending")[0]
    @cart = Cart.create(state:"pending",profile_id: @profile.id) unless @cart
    @guest_order = guest_user.profile.orders
    @guest_order.each do |order|
      o = Order.new(composition_nickname: order.composition_nickname, composition_id: order.composition_id)
      o.profile = @profile
      o.cart = @cart
      o.save
    end
  end
end