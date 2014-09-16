class Foswipe::UserGroupsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :user_group
  def initialize(user, user_group)
    @user = user
    @user_group = user_group
  end

  def index?
    true
  end

  def show?
    @user.admin_or_agent? || @user.user_groups.include?(@user_group)
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