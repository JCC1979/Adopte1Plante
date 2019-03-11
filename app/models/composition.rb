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
<<<<<<< HEAD
    price = 0
    variants = variants_match.split(";")
    variants.each do |variant|
      price += Variant.find(variant.to_i).price_cents
    end
    price
=======
    Variant_pot.find(sku: variant_pot_sku).price_cents + Variant_plant.find(sku: variant_plant_sku).price_cents
>>>>>>> c8e82949dbf4d2a349df21272d716e31f073dd3e
  end
end
