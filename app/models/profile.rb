class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy

  def nbr_orders
    if self.carts.where(state: "pending")[0]
      self.carts.where(state: "pending")[0].orders.size
    else
      0
    end
  end

  def cart_id
    if Cart.where(profile_id: self.id, state: "pending")[0]
      Cart.where(profile_id: self.id, state: "pending")[0].id
    else
      Cart.create(state: "pending", profile_id: self.id).id
    end
  end
end
