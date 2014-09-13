class Foswipe::ClientsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :client
  def initialize(user, client)
    @user = user
    @client = client
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