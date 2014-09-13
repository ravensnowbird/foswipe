class Foswipe::ClientsPolicy < Foswipe::ApplicationPolicy
  attr_reader :user, :client
  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
    @user.admin_or_agent?
  end

  def show?
    user == client
  end

  def new?
    @user.admin_or_agent?
  end

  def edit?
    @user.admin? || @user == @client
  end

  def create?
    @user.admin_or_agent?
  end

  def update?
    @user.admin? || @user == @client
  end

  def destroy?
    @user.admin_or_agent?
  end

end