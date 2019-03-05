class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :address_zipcode, presence: true
  validates :address_city, presence: true
  validates :address_country, presence: true
  
  belongs_to :user
  has_many :orders
end
