class Plant < ApplicationRecord
  has_many :variant_plants, dependent: :destroy
  validates :id_code, presence: true
  validates :family, presence: true
  validates :gender, presence: true
  validates :species, presence: true
  validates :easy_seed_matching, presence: true, uniqueness: true
  validates :sun_exposure, presence: true, inclusion: { in:["jamais directement au soleil", "zone sombre", "ombragé", "ensoleillé", "désertique"] }
  validates :watering, presence: true, inclusion: { in:["si la terre est sèche", "1 fois par semaine", "2 fois par semaine", "3 fois par semaine", "en abondance"] }

  def fullname
    gender.capitalize + ' ' + species
  end

  def givevariant(size)
    variant_plants.where(height_format: size)&.first
  end

  def skuforplant(size)
    var = variant_plants.where(height_format: size)&.first
    if var.nil?
      return ""
    else
      return var.sku
    end
  end

  def pots
    sku_plants = self.variant_plants.pluck(:sku)
    list_variant_pots = []
    sku_plants.each do |sku_plant|
      list_variant_pots << Composition.findcompos_by_plant(sku_plant).pluck(:variant_pot_sku)
    end
    list_variant_pots.flatten!.compact!
    list_variant_pots.map! do |pot_sku|
      VariantPot.find_by(sku: pot_sku).pot
    end
    list_variant_pots.uniq
  end

  def min_price_compo
    plant_s = self.givevariant("S")
    variant_pots_s = Composition.findcompos_by_plant(plant_s.sku).pluck(:variant_pot_sku)
    variant_pots_s.map! do |pot_sku|
      VariantPot.find_by(sku: pot_sku)
    end
    variant_pots_s.compact!.pluck(:price_cents).min + plant_s.price_cents
  end

  def image_random
    plant_m = self.givevariant("M")
    Composition.findcompos_by_plant(plant_m.sku).drop(1).sample.photo
  end 

  def photo(size)
    plant_m = self.givevariant(size)
    Composition.findcompos_by_plant(plant_m.sku).first.photo
  end

# ne fonctionne pas
  # def nbercompoforpot(pot)
  #   num = 0
  #   variant_plants.each do |var|
  #     search_composition = Composition.all.select do |comp|
  #       (comp.variant_plant_sku == var.sku) && (comp.variant_pot_sku.present?)
  #     end
  #     num += search_composition.size unless search_composition.nil?
  #   end
  #   num
  # end
end
