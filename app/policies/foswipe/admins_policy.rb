class Foswipe::AdminsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :admin
  def initialize(user, admin)
    @user = user
    @admin = admin
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