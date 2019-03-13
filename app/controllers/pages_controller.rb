class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  helper_method :current_or_guest_user
  def home
    @plants = Plant.all.sample(Plant.all.size)
    session[:cart_guest] = false
  end
end
