class Product < ApplicationRecord
  validates :category, presence: true
  validates :details, presence: true
  
  belongs_to :category
  has_many :variants

  include AlgoliaSearch

  algoliasearch do
    attribute :category_id
  end
end