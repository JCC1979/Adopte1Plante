class Pot < ApplicationRecord
  has_many :variant_pots, dependent: :destroy
  validates :name, presence: true
  validates :material, presence: true
  validates :color, presence: true
end
