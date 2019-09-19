class RobotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end 
  end

  #Everyone can see the robots.
  def show?
    true
  end

  def update?
    #Only user owner can update the robot records.
    record.user == user
  end

  def create?
    #Any looged user can create a robot.
    !user.nil?
  end

  def destroy?
    #Only user owner can destroy the robot records as #update
    update?
  end

end

