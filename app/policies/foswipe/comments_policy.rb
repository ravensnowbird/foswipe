class Foswipe::CommentsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :comment
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
    @user.admin_or_agent?
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