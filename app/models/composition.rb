class Composition < ApplicationRecord
  # validates :variants_match, presence: true, uniqueness: true

  has_many :orders
  has_many :ratings

  mount_uploader :photo, PhotoUploader
end
