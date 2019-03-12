class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.profile == user.profile
  end

  def create?
    true
  end
end
