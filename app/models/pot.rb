class Pot < ApplicationRecord
  has_many :variant_pots, dependent: :destroy
  validates :name, presence: true
  validates :material, presence: true
  validates :color, presence: true

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
end
