class Variant < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  validates :diameter_cm, presence: true
  validates :height_format, presence: true

  belongs_to :product
  has_one :synonym, through: :products
  has_one :category, through: :products

  monetize :price_cents

  def method_missing(met, *args, &block)
    product.details[met.to_s]
  end

  def plant_price
    product.variants.pluck(:height_format, :price_cents).to_h
  end
end
