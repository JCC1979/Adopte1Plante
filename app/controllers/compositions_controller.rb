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
    @composition = Composition.new(compo_params_direct)
    authorize @composition
    addr = "compositions/" + compo_params_direct[:photo]
    result = Composition.where(variant_pot_sku: compo_params_direct[:variant_pot_sku], variant_plant_sku: compo_params_direct[:variant_plant_sku])&.first

    if (result.nil? && result&.variant_pot_sku.present? && result&.variant_plant_sku.present? )
      Composition.create!(variant_pot_sku: compo_params_direct[:variant_pot_sku], variant_plant_sku: compo_params_direct[:variant_plant_sku], photo: addr)
    elsif result.present?
      result.update!(photo: addr)
    else
      # message alerte
    end

    redirect_to compositions_path
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
    params.require(:composition).permit(:photo, :variant_pot_sku, :variant_plant_sku)
  end

  def compo_params_direct
    params.permit(:photo, :variant_pot_sku, :variant_plant_sku)
  end

  def set_composition
    @composition = Composition.find(params[:id])
  end
end
