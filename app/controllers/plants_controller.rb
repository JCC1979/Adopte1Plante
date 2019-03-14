class PlantsController < ApplicationController
  before_action :set_plant, only: %i[edit update destroy show]
  skip_before_action :authenticate_user!, only: %i[show index]
  helper_method :current_or_guest_user

  def index
    @params = params[:term]
    if @params

      if @params.length < 4
        results = Plant.order(:gender, :species, :variant, :cultivar).searchgenderonly(@params)
      else
        results = Plant.order(:gender, :species, :variant, :cultivar).searchtotal(@params)
      end
      @plants = policy_scope(results)

      respond_to do |format|
        format.html
        format.json
      end
    else
      @plants = policy_scope(Plant)
    end
  end

  def show
    @composition = Composition.find(params[:format]) if params[:format]
    @plants = Plant.all.sample(3)
    authorize @plant
    @pots = @plant.pots
    session[:cart_guest] = false
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
