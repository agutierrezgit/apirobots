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
end
