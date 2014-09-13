class Foswipe::PurchasesPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :purchase
  def initialize(user, purchase)
    @user = user
    @purchase = purchase
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