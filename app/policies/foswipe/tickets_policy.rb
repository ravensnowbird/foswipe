class Foswipe::TicketsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :ticket
  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def index?
    false
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