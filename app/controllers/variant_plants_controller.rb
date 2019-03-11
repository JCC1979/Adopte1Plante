class VariantPlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  helper_method :current_or_guest_user

  def show
    @pots = []
    @pots << VariantPot.find(2)
    @pots << VariantPot.find(5)
    @pots << VariantPot.find(8)
    @variant_plant = VariantPlant.find(params[:id])
    @order = Order.new
  end

  def new
    @plant = Plant.find(params[:plant_id])
    authorize @plant
    @variant_plant = VariantPlant.new
    authorize @variant_plant
  end

  def create
    @plant = Plant.find(params[:plant_id])
    authorize @plant
    @variant_plant = VariantPlant.new(variant_params)
    authorize @variant_plant
    @variant_plant.plant = @plant

    if @variant_plant.save
      @composition = Composition.create!(local_image: ("variants_plant/" + params[:photo_file_variant]), variant_plant_sku: @variant_plant.sku)
      redirect_to edit_plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    @variant_plant = VariantPlant.find(params[:id])
    authorize @variant_plant
  end

  def update
    @variant_plant = VariantPlant.find(params[:id])
    authorize @variant_plant
    if @variant_plant.update(variant_params)
      @composition = @variant_plant.findcompositionforplantvariant
      if @composition.nil?
        Composition.create!(local_image: ("variants_plant/" + params[:photo_file_variant]), variant_plant_sku: @variant_plant.sku)
      else
        @composition.update!(local_image: ("variants_plant/" + params[:photo_file_variant]), variant_plant_sku: @variant_plant.sku)
      end
      redirect_to edit_plant_path(@variant_plant.plant)
    else
      render :edit
    end
  end

  def destroy
    @variant_plant = VariantPlant.find(params[:id])
    authorize @variant_plant
    @variant_plant.destroy
    @plant = @variant_plant.plant
    authorize @plant
    redirect_to edit_plant_path(@plant)
  end

  private

  def variant_params
    params.require(:variant_plant).permit(:sku, :diameter_cm, :height_format, :photo_file_variant)
  end
end
