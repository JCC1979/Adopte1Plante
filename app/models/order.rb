class Order < ApplicationRecord
  validates :composition_nickname, presence: true, uniqueness: { scope: :profile_id, message: "one of your plant already have this nickname" }
  validates :status, presence: true

  belongs_to :profile
  belongs_to :composition
end
