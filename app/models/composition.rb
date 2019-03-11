class Composition < ApplicationRecord
  has_many :orders
  has_many :ratings

  mount_uploader :photo, PhotoUploader

  def self.findphoto(hash_sku)
    search_composition = Composition.all.select do |comp|
      (comp.variant_plant_sku == hash_sku[:variant_plant_sku]) && (comp.variant_pot_sku == hash_sku[:variant_pot_sku])
    end
    good_composition = search_composition&.first
    return good_composition&.local_image unless good_composition.nil?
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
