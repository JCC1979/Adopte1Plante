class Product < ApplicationRecord
  validates :category, presence: true
  validates :details, presence: true

  belongs_to :category
  has_many :variants

  def method_missing(met, *args, &block)
    details[met.to_s]
  end
end
