class Variant < ApplicationRecord
  validates :sku, presence: true, uniqueness: { message: "this sku already exists" }
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

  def findphotovariant
    good_composition = Composition.all.select do |comp|
      (comp.variants_match.keys.count == 1) && (sku == comp.variants_match.values)
    end
    return good_composition
  end

  # composition.variants_match[:pot].photo_url

  def self.findphotocompo(variant1, variant2)
    vtype1 = variant1.product.category.name
    vtype2 = variant2.product.category.name
    good_composition = Composition.all.select do |comp|
      ((variant1.sku == comp.variants_match[vtype1.to_s]) && (variant2.sku == comp.variants_match[vtype2.to_s]))
    end

    return good_composition
  end

  def method_missing(met, *args, &block)
    product.details[met.to_s]
  end
end
