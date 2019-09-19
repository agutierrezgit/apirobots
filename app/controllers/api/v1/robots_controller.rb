class Api::V1::RobotsController < Api::V1::BaseController
    before_action :find_robot, only: [ :show]
  
  #GET /api/v1/robots  #unauthenticated
  def index
    @robots = policy_scope(Robot)
  end

  #GET /api/v1/robots/:id
  def show
    authorize @robot

  end

  private

  def find_robot
    @robot = Robot.find(params[:id])
  end

end