class Synonym < ApplicationRecord
  validates :commercial_name, presence: true, uniqueness: true
  
  belongs_to :product
  has_many :variants, trought: :products
end
