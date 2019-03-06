class Variant < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  validates :diameter_cm, presence: true
  validates :height_format, presence: true

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

  def details
    product.details
  end
  
end
