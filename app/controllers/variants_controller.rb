class VariantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def index
    @variants = Variant.all
  end

  def show
    @variant = Variant.find(params[:id])
  end
  
  
  def new
    @product = Product.find(params[:product_id])
    @variant = Variant.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.new(variant_params)
    @variant.product = Product.find(params[:product_id])
    @composition = Composition.new

    if @variant.product.category.name == "pot"
      @composition.variants_match = { pot: @variant.sku }
    elsif @variant.product.category.name == "plant"
      @composition.variants_match = { plant: @variant.sku }
    end

    # vtype = @variant.product.category.name
    # @composition.variants_match[vtype] = @variant.sku

    if params[:image_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
      raise "Invalid upload signature" if !preloaded.valid?
      @composition.image_id = preloaded.identifier
      if @variant.save! && @composition.save!
        redirect_to product_path(@product)
      else
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
    params.require(:variant).permit(:sku, :product_id, :price, :diameter_cm, :height_format, :image_id)
  end
end
