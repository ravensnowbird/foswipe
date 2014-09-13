class Foswipe::AdminsPolicy < Foswipe::ApplicationPolicy
  attr_reader :c_user, :user
  def initialize(c_user, user)
    @c_user = c_user
    @user = user
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