class Composition < ApplicationRecord
  validates :variants_match, presence: true, uniqueness: true
  validates :photo_url, presence: true

  has_many :orders
  has_many :ratings
end
