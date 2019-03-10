class Composition < ApplicationRecord
  # validates :variants_match, presence: true, uniqueness: true

  has_many :orders
  has_many :ratings

  mount_uploader :photo, PhotoUploader

  def price
    price = 0
    variants = self.variants_match.split(";")
    variants.each do |variant|
      price += Variant.find(variant.to_i).price_cents
    end
    price
  end
end
