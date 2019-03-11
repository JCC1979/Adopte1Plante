class VariantPotsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
    
  def new
    @plant = Plant.find(params[:product_id])
    authorize @plant
    @variant_pot = VariantPot.new
    authorize @variant_pot
  end
  
  def create
    @plant = Plant.find(params[:product_id])
    authorize @plant
    @variant_pot = VariantPot.new(variant_params)
    authorize @variant_pot
    @variant_pot.pot = Plant.find(params[:product_id])
    @composition = Composition.new
    @composition.variants_match = { pot: @variant.sku }

    if params[:image_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
      raise "Invalid upload signature" if !preloaded.valid?
      @composition.image_id = preloaded.identifier
      if @variant_pot.save! && @composition.save!
        # set_flash_message! :notice, :"Variant saved"
        redirect_to product_path(@plant)
      else
        # set_flash_message! :alert, :"Problem on save operation"
        render :new
      end
    end
  end

  def update
  end

  def destroy
    
  end

  private

  def variant_params
    params.require(:variant_pot).permit(:sku, :diameter_cm, :heigh_format)
  end
end

