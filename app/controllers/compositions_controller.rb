class CompositionsController < ApplicationController
  def index
    @compositions = policy_scope(Composition)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
