class MicropostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def new?
    owner?
  end
  def edit?
    owner?
  end
  def create?
    owner?
  end
  def update?
    owner?
  end
  def destroy?
    owner?
  end

  private
    def owner?
      @user == @record.user
    end
end
