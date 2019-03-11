class VariantPotsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_variant_pot, only: [:edit, :update, :destroy]
  helper_method :current_or_guest_user

  def new
    @pot = Pot.find(params[:pot_id])
    authorize @pot
    @variant_pot = VariantPot.new
    authorize @variant_pot
  end

  def create
    @pot = Pot.find(params[:pot_id])
    authorize @pot
    @variant_pot = VariantPot.new(variant_params)
    @variant_pot.pot = @pot
    authorize @variant_pot

    if @variant_pot.save
      @composition = Composition.create!(local_image: ("variants_pot/" + params[:photo_file_variant]), variant_pot_sku: @variant_pot.sku)
      authorize @composition
      redirect_to edit_pot_path(@pot)
    else
      render :new
    end
  end

  def edit
    authorize @variant_pot
  end

  def update
    authorize @variant_pot
    if @variant_pot.update(variant_params)
      @composition = @variant_pot.findcompositionforpotvariant
      if @composition.nil?
        @composition = Composition.create!(local_image: ("variants_pot/" + params[:photo_file_variant]), variant_pot_sku: @variant_pot.sku)
        authorize @composition
      else
        @composition.update!(local_image: ("variants_pot/" + params[:photo_file_variant]), variant_pot_sku: @variant_pot.sku)
      end
      redirect_to edit_pot_path(@variant_pot.pot)
    else
      render :edit
    end
  end

  def destroy
    authorize @variant_pot
    @variant_pot.destroy
    @pot = @variant_pot.pot
    authorize @pot
    redirect_to edit_pot_path(@pot)
  end

  private

  def variant_params
    params.require(:variant_pot).permit(:sku, :diameter_cm, :height_format, :photo_file_variant, :price)
  end

  def set_variant_pot
    @variant_pot = VariantPot.find(params[:id])
  end
end