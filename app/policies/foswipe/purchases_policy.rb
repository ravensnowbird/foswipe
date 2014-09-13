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
    @user.admin_or_agent? || (@user.organization ? @user.organization.purchases.incude?(@purchase) : false)
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