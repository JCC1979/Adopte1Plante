class Composition < ApplicationRecord
  validates :variant_plant_sku, uniqueness: { scope: :variant_pot_sku }

  has_many :orders
  has_many :ratings

  mount_uploader :photo, PhotoUploader

  def self.findphoto(hash_sku)
    search_composition = Composition.all.select do |comp|
      (comp.variant_plant_sku == hash_sku[:variant_plant_sku]) && (comp.variant_pot_sku == hash_sku[:variant_pot_sku])
    end
    good_composition = search_composition&.first
    if good_composition.nil?
      return "variants_plant/default.png"
    else
      return good_composition.local_image
    end
  end

  def price
    VariantPot.find_by(sku: variant_pot_sku).price_cents + VariantPlant.find_by(sku: variant_plant_sku).price_cents
  end

  def self.findcompo(hash_sku)
    search_composition = Composition.all.select do |comp|
      (comp.variant_plant_sku == hash_sku[:variant_plant_sku]) && (comp.variant_pot_sku == hash_sku[:variant_pot_sku])
    end
    good_composition = search_composition&.first
    return good_composition unless good_composition.nil?
  end

  def self.findcompos_by_plant(plant_sku)
    self.where(variant_plant_sku: plant_sku)
  end
end
