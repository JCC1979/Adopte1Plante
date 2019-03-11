class CompositionsController < ApplicationController

  helper_method :current_or_guest_user

  def index
    @compositions = policy_scope(Composition)
    @plants = policy_scope(Plant)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
