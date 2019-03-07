class VariantsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @variant = Variant.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.new(variant_params)
    @variant.product = Product.find(params[:product_id])
    @variant.save
    redirect_to product_path(@product)
  end

  def update
  end

  def destroy
  end

  private

  def variant_params
    params.require(:variant).permit(:sku, :product_id, :price, :diameter_cm, :height_format)
  end
end
