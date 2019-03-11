class VariantPot < ApplicationRecord
  belongs_to :pot
  validates :sku, presence: true,uniqueness: true
  validates :diameter_cm, presence: true
  validates :height_format, presence: true, inclusion: { in: %w(S M L)}
  monetize :price_cents

  def prices
    pot.variant_pots.pluck(:height_format, :price_cents).to_h
  end

  def ids
    pot.variant_pots.pluck(:height_format, :id).to_h
  end

  def findphoto
    search_composition = Composition.all.select do |comp|
      (comp.variant_pot_sku == self.sku) && (comp.variant_plant_sku.nil?)
    end
    good_composition = search_composition&.first

    if good_composition.nil?
      return "variants_pot/default.png"
    else
      return good_composition.local_image
    end
  end

  def findcompositionforpotvariant
    search_composition = Composition.all.select do |comp|
      (comp.variant_pot_sku == self.sku) && (comp.variant_plant_sku.nil?)
    end
    good_composition = search_composition&.first
  end
end
