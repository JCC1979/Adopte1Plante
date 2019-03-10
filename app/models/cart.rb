class Cart < ApplicationRecord
  belongs_to :profile
  has_many :orders
  monetize :amount_cents

  def nbr_order(user)
    Cart.where(profile_id: user, state: "pending")[0].orders.size
  end
end
