class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  helper_method :current_or_guest_user
  def new
  end

  def create
  end

  def show
    @profile = @profile = Profile.find(params[:id])
    @carts = current_user.profile.carts.where.not(state: "pending").order(created_at: :desc)
  end

  def my_plants
    @orders = current_user.profile.orders.order(created_at: :asc)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :address, :address_city, :address_zipcode, :address_country)
  end

end
