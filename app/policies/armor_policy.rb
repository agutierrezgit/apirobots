class ArmorPolicy < ApplicationPolicy
  class Scope < Scope  
  def resolve
      scope.all
    end 
  end

  #Everyone can see the armors.
  def show?
    true
  end

  def update?
    #Only user owner can update the armors records.
    record.robot.user == user
  end

  def create?
    #Only user owner can create the armors records.
    update?
  end

  def destroy?
    #Only user owner can destroy the armors records as #update
    update?
  end
end
