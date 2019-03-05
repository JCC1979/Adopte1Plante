class Rating < ApplicationRecord
  validates :rate, presence: true
  validates :comment, presence: true
  belongs_to :composition
end
