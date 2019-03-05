class Variant < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  validates :diameter_cm, presence: true
  validates :height_format, presence: true

  belongs_to :product
  has_one :synonym, through: :products
end
