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
end
