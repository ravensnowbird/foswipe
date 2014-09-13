class Foswipe::SupportsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :support
  def initialize(user, support)
    @user = user
    @support = support
  end

  def index?
    @user.admin_or_agent?
  end

  def show?
    @user.admin_or_agent?
  end

  def new?
    @user.admin?
  end

  def edit?
    @user.admin? || @user == @support
  end

  def create?
    @user.admin?
  end

  def update?
     @user.admin? || @user == @support
  end

  def destroy?
    @user.admin?
  end
end