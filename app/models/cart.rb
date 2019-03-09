class Cart < ApplicationRecord
  belongs_to :profile
  has_many :orders
end
