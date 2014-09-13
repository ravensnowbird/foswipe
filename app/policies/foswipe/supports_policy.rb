class Foswipe::SupportsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :support
  def initialize(user, support)
    @user = user
    @support = support
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