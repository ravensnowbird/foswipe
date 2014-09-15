class Foswipe::ProductsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :product
  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    @user.admin_or_agent?
  end

  def show?
    @user.admin_or_agent?
  end

  def new?
    @user.admin_or_agent?
  end

  def edit?
    @user.admin_or_agent?
  end

  def create?
    @user.admin_or_agent?
  end

  def update?
    @user.admin_or_agent?
  end

  def destroy?
    @user.admin_or_agent?
  end
end