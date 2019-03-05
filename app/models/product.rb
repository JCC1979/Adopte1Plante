class Product < ApplicationRecord
  validates :category, presence: true
  validates :details, presence: true
  
  belongs_to :category
  has_many :variants
end
