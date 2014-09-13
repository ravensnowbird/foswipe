class Foswipe::OrganizationsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :organization
  def initialize(user, organization)
    @user = user
    @organization = organization
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