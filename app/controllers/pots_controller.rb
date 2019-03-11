class PotsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @pots = policy_scope(Pot)
  end

  def show
    authorize @pot
    @variant_pots = @pot.variant_pots
    @variantS = @variant_pots.where(height_format: "S")&.first
    @variantM = @variant_pots.where(height_format: "M")&.first
    @variantL = @variant_pots.where(height_format: "L")&.first
    authorize @variant_pots

    @newvariant = VariantPot.new
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
    @variant_pots = @pot.variant_pots
    authorize @variant_pots
    @variantS = @variant_pots.where(height_format: "S")&.first
    @variantM = @variant_pots.where(height_format: "M")&.first
    @variantL = @variant_pots.where(height_format: "L")&.first

    @newvariant = VariantPot.new
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

  def set_product
    @pot = Pot.find(params[:id])
  end
end
