class VariantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def index
    @variants = Variant.all
  end

  def show
    @pots = []
    @pots << Variant.find(2)
    @pots << Variant.find(5)
    @pots << Variant.find(8)
    @variant = Variant.find(params[:id])
    @order = Order.new
  end

  def new
    @product = Product.find(params[:product_id])
    @variant = Variant.new
  end

  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.new(variant_params)
    @variant.product = Product.find(params[:product_id])
    @variant.save
    @composition = Composition.new

    if params[:image_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
      raise "Invalid upload signature" if !preloaded.valid?
      @composition.photo_url = preloaded.identifier

      if @variant.product.category.name == "pot"
        @composition.variants_match = { pot: @variant.sku }
      elsif @variant.product.category.name == "plant"
        @composition.variants_match = { plant: @variant.sku }
      end

      @composition.save!
    end

    redirect_to product_path(@product)
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
