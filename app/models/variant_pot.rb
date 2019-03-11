class VariantPot < ApplicationRecord
  belongs_to :pot
  validates :sku, presence: true,uniqueness: true
  validates :diameter_cm, presence: true
  validates :height_format, presence: true, inclusion: { in: %w(S M L)}

  def findphoto
    good_composition = Composition.all.select do |comp|
      (comp.variant_pot_sku == sku) && (comp.variant_plant_sku.nil?)
    end

    if good_composition.any?
      return good_composition.local_image
    else
      return "variants_pot/default.png"
    end
  end
end
