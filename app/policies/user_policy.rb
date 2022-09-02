class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def edit?
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
      (@user == @record) || (@user.is_admin?)
    end
end
