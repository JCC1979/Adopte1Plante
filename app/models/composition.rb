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

  def self.findcompo(hash_sku)
    search_composition = Composition.all.select do |comp|
      (comp.variant_plant_sku == hash_sku[:variant_plant_sku]) && (comp.variant_pot_sku == hash_sku[:variant_pot_sku])
    end
    good_composition = search_composition&.first
    return good_composition unless good_composition.nil?
  end

  def price
    Variant_pot.find(sku: variant_pot_sku).price_cents + Variant_plant.find(sku: variant_plant_sku).price_cents
  end
end
