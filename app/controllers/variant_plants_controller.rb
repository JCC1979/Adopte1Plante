class VariantPlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_variant_plant, only: [:edit, :update, :destroy]
  helper_method :current_or_guest_user

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
    @variant_plant.plant = @plant
    authorize @variant_plant

    if @variant_plant.save
      @composition = Composition.create!(photo: ("Adopte1plante/" + params[:photo_file_variant]), variant_plant_sku: @variant_plant.sku)
      authorize @composition
      redirect_to edit_plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    authorize @variant_plant
  end

  def update
    authorize @variant_plant
    if @variant_plant.update(variant_params)
      @composition = @variant_plant.findcompositionforplantvariant
      if @composition.nil?
        @composition = Composition.create!(photo: ("Adopte1plante/" + params[:photo_file_variant]), variant_plant_sku: @variant_plant.sku)
        authorize @composition
      else
        @composition.update!(photo: ("Adopte1plante/" + params[:photo_file_variant]), variant_plant_sku: @variant_plant.sku)
      end
      redirect_to edit_plant_path(@variant_plant.plant)
    else
      render :edit
    end
  end

  def destroy
    authorize @variant_plant
    @variant_plant.destroy
    @plant = @variant_plant.plant
    authorize @plant
    redirect_to edit_plant_path(@plant)
  end

  private

  def variant_params
    params.require(:variant_plant).permit(:sku, :diameter_cm, :height_format, :photo_file_variant, :price)
  end

  def set_variant_plant
    @variant_plant = VariantPlant.find(params[:id])
  end
end
