class Composition < ApplicationRecord
  has_many :orders
  has_many :ratings

  mount_uploader :photo, PhotoUploader

  def findphoto
    hash_sku = { variant_plant_sku: "dfdsf" }
    search_composition = Composition.all.select do |comp|
      (comp.variant_plant_sku == hash_sku[:variant_plant_sku]) && (comp.variant_pot_sku == hash_sku[:variant_pot_sku])
    end
    good_composition = search_composition&.first
    return good_composition.local_image unless good_composition.nil?
  end

  def price
    VariantPot.find_by(sku: variant_pot_sku).price_cents + VariantPlant.find_by(sku: variant_plant_sku).price_cents
  end
end
