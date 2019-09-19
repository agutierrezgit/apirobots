class WeaponPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end 
  end

  #Everyone can see the weapons.
  def show?
    true
  end

  def update?
    #Only user owner can update the weapons records.
    record.user == user
  end

  def create?
    #Any looged user can create a weapons.
    !user.nil?
  end

  def destroy?
    #Only user owner can update the weapons records as #update
    update?
  end
end
