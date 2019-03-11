class VariantPotsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
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
    authorize @variant_pot
    @variant_pot.pot = @pot

    if @variant_pot.save
      @composition = Composition.create!(local_image: ("variants_pot/" + params[:photo_file_variant]), variant_pot_sku: @variant_pot.sku)
      redirect_to edit_pot_path(@pot)
    else
      render :new
    end
  end

  def edit
    @variant_pot = VariantPot.find(params[:id])
    authorize @variant_pot
  end

  def update
    @variant_pot = VariantPot.find(params[:id])
    authorize @variant_pot
    if @variant_pot.update(variant_params)
      @composition = @variant_pot.findcompositionforpotvariant
      if @composition.nil?
        Composition.create!(local_image: ("variants_pot/" + params[:photo_file_variant]), variant_pot_sku: @variant_pot.sku)
      else
        @composition.update!(local_image: ("variants_pot/" + params[:photo_file_variant]), variant_pot_sku: @variant_pot.sku)
      end
      redirect_to edit_pot_path(@variant_pot.pot)
    else
      render :edit
    end
  end

  def destroy
    @variant_pot = VariantPot.find(params[:id])
    authorize @variant_pot
    @variant_pot.destroy
    @pot = @variant_pot.pot
    authorize @pot
    redirect_to edit_pot_path(@pot)
  end

  private

  def variant_params
    params.require(:variant_pot).permit(:sku, :diameter_cm, :height_format, :photo_file_variant)
  end
end