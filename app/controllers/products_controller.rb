class ProductsController < ApplicationController
  def index
    @products = Product.all
    @pots = Product.all.select { |prod| prod.category.name == "pot" }
    @plants = Product.all.select { |prod| prod.category.name == "plant" }
  end

  def show
    @product = Product.find(params[:id])
    @variant = Variant.new
    @variants = Variant.where(product_id: @product.id)
    @composition = Composition.last
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.details = details_params.to_h
    @product.category = Category.find(categ_params[:category_id].to_i)
    if @product.save!
      redirect_to products_path
    else
      render :new
    end
  end

  def update
  end

  private

  def categ_params
    params.require(:product).permit(:category_id)
  end

  def details_params
    params.require(:details).permit(:name, :material, :color, :id_code, :id_sup, :family, :gender, :species, :variant, :cultivar, :watering, :description, :sun_exposure)
  end
end
