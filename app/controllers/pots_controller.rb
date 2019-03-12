class PotsController < ApplicationController
  before_action :set_pot, only: [:edit, :update, :destroy]
  helper_method :current_or_guest_user

  def index
    @pots = policy_scope(Pot)
  end

  def new
    @pot = Pot.new
    authorize @pot
  end

  def create
    @pot = Pot.new(pot_params)
    authorize @pot
    if @pot.save
      redirect_to pots_path
    else
      render :new
    end
  end

  def edit
    authorize @pot

    @newvariant = VariantPot.new
    authorize @newvariant
  end

  def update
    authorize @pot
    if @pot.update(pot_params)
      redirect_to pots_path
    else
      render :edit
    end
  end

  def destroy
    authorize @pot
    @pot.destroy
    redirect_to pots_path
  end

  private

  def pot_params
    params.require(:pot).permit(:name, :material, :color)
  end

  def set_pot
    @pot = Pot.find(params[:id])
  end
end
