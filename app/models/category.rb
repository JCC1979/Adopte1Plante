class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :products
  has_many :variants, through: :products
end
