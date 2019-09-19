class RobotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end 
  end

  #Authorize show view
  def show?
    true
  end

  def update?
    #Only user owner can update the robot records
    record.user == user
  end

  def create?
    update?
  end
end
