class Foswipe::OrganizationsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :organization
  def initialize(user, organization)
    @user = user
    @organization = organization
  end

  def index?
    @user.admin_or_agent?
  end

  def show?
    unless @user.customer?
    return true
    else
    @user.organigation == @organization
    end
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
    check_user
  end

  def destroy?
    @user.admin_or_agent?
  end
end