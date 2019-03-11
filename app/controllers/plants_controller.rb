class PlantsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  helper_method :current_or_guest_user

  def index
    @plants = policy_scope(Plant)
  end

  def show
    authorize @plant
    @variant_plants = @plant.variant_plants
    @variantS = @variant_plants.where(height_format: "S")&.first
    @variantM = @variant_plants.where(height_format: "M")&.first
    @variantL = @variant_plants.where(height_format: "L")&.first
    authorize @variant_plants

    @newvariant = VariantPlant.new
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    if @plant.save
      redirect_to plants_path
    else
      render :new
    end
  end

  def edit
    authorize @plant
    @variant_plants = @plant.variant_plants
    authorize @variant_plants
    @variantS = @variant_plants.where(height_format: "S")&.first
    @variantM = @variant_plants.where(height_format: "M")&.first
    @variantL = @variant_plants.where(height_format: "L")&.first

    @newvariant = VariantPlant.new
  end

  def update
    authorize @plant
    if @plant.update(plant_params)
      redirect_to plants_path
    else
      render :edit
    end
  end

  def destroy
    authorize @plant
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:id_code, :id_sup, :family, :gender, :species, :variant, :cultivar, :watering, :description, :sun_exposure, :commercial_name, :synonyms_list)
  end

  def set_product
    @plant = Plant.find(params[:id])
  end
end
