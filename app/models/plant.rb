class Plant < ApplicationRecord
  has_many :variant_plants, dependent: :destroy
  validates :gender, presence: true
  validates :family, presence: true
  validates :species, presence: true
  validates :id_code, presence: true

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
