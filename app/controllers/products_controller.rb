class ProductsController < ApplicationController
  def index
    @products = Product.all
    @pots = Product.where(`category.name = "pot"`)
    @plants = Product.where(`category.name = "plante"`)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save

    redirect_to product_path(@product)
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :details)
  end
end
