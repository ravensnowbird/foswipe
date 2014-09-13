class Foswipe::ProjectsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :project
  def initialize(user, project)
    @user = user
    @project = project
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