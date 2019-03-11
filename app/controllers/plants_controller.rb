class PlantsController < ApplicationController
  before_action :set_plant, only: %i[edit update destroy show]
  helper_method :current_or_guest_user

  def index
    @plants = policy_scope(Plant)
  end

  def show
    authorize @plant
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

    @newvariant = VariantPlant.new
    authorize @newvariant
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

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
