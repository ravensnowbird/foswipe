class Foswipe::ProductsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :product
  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end