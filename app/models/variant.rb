class Variant < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  validates :diameter_cm, presence: true
  validates :height_format, presence: true, uniqueness: { scope: :product_id, message: "only one variant per format" }

  belongs_to :product
  has_one :synonym, through: :products
  has_one :category, through: :products

  # def to_json(key)
  #   product.details[key.to_s]
  #   product.details
  # end

  # def json_keys
  #   product.details.to_h.keys
  # end
  
  def method_missing(met, *args, &block)
    product.details[met.to_s]
  end
  
end
