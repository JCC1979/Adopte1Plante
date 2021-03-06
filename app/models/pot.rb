class Pot < ApplicationRecord
  has_many :variant_pots, dependent: :destroy
  validates :name, presence: true
  validates :easy_seed_matching, presence: true, uniqueness: true

  def givevariant(size)
    variant_pots.where(height_format: size)&.first
  end

  def skuforpot(size)
    var = variant_pots.where(height_format: size)&.first
    if var.nil?
      return ""
    else
      return var.sku
    end
  end

  def photo
    pot = self.givevariant("M")
    Composition.findcompos_by_pot(pot).first.photo
  end
end
