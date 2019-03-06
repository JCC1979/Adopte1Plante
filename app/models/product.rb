class Product < ApplicationRecord
  include AlgoliaSearch
  
  validates :category, presence: true
  validates :details, presence: true

  belongs_to :category
  has_many :variants

  algoliasearch do
    attribute :category_id
  end

  def method_missing(met, *args, &block)
    details[met.to_s]
  end
end

