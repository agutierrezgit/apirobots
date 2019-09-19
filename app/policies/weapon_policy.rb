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
    record.robot.user == user
  end

  def create?
    #Only user owner can create the weapons records.
    update?
  end

  def destroy?
    #Only user owner can destroy the weapons records as #update
    update?
  end
end
