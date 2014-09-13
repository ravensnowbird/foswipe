class Foswipe::AdminsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :admin
  def initialize(user, admin)
    @user = user
    @admin = admin
  end

  def index?
    check_user
  end

  def show?
    check_user
  end

  def new?
    check_user
  end

  def edit?
    check_user
  end

  def create?
    check_user
  end

  def update?
    check_user
  end

  def destroy?
    check_user
  end
  private

  def check_user
    if @user.admin?
    return true
    else
    return false
    end
  end
end