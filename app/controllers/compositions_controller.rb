class CompositionsController < ApplicationController
  def index
    @compositions = policy_scope(Composition)
  end

  def show
  end
end
