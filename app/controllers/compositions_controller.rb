class CompositionsController < ApplicationController
  helper_method :current_or_guest_user

  def index
    @compositions = policy_scope(Composition)
    @plants = policy_scope(Plant)
    @pots = policy_scope(Pot)
  end

  def show
  end

  def new
    @composition = Composition.new
    authorize @composition
  end

  def create
    @composition = Composition.new(compo_params)
    authorize @composition
    if @composition.save
      redirect_to plants_path
    else
      render :new
    end
  end

  def edit
    authorize @composition

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
  end

  private

  def compo_params
    params.require(:composition).permit(:local_image, :variant_pot_sku, :variant_plant_sku)
  end

  def set_composition
    @composition = Composition.find(params[:id])
  end
end
