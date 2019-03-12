class RegistrationsController < Devise::RegistrationsController
  helper_method :current_or_guest_user
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        @profile = Profile.new(profile_params)
        @profile.user = User.last
        @profile.save if User.last.profile.nil?
        create_new_order
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    
    

  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end

  def create_new_order
    @cart = Cart.where(profile_id: @profile.id, state: "pending")[0]
    @cart = Cart.create(state:"pending",profile_id: @profile.id) unless @cart
    @guest_order = guest_user.profile.orders
    @guest_order.each do |order|
      o = Order.new(composition_nickname: order.composition_nickname, composition_id: order.composition_id)
      o.profile = @profile
      o.cart = @cart
      o.save
      @cart.amount_cents += o.composition.price
      @cart.save
    end
  end
end