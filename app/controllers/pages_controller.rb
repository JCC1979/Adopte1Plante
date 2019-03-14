class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  helper_method :current_or_guest_user
  def home
    if params["choices-multiple-remote-fetch"]
      searchselect = params["choices-multiple-remote-fetch"]
      searchtable = searchselect.split(/ /)

      if searchtable.length == 1
        @plants = Plant.searchgenderonly(searchselect) + Plant.all
        @plants = @plants.uniq
      else
        @plants = Plant.searchtotal(searchselect) + Plant.searchgenderonly(searchtable[0]) + Plant.all
        @plants = @plants.uniq
      end
      
    else
      @plants = Plant.all.sample(Plant.all.size)
    end
    session[:cart_guest] = false
  end
end
