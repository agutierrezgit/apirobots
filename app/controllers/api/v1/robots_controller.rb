class Api::V1::RobotsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]  
  before_action :set_robot, only: [ :show, :update, :destroy]
  
  #GET /api/v1/robots  #unauthenticated
  def index
    @robots = policy_scope(Robot)
  end

  #GET /api/v1/robots/:id
  def show
  end

  #POST /api/v1/robots #authenticated
  def create
    @robot = Robot.new(robot_params)
    @robot.user = current_user
    authorize @robot
    if @robot.save
      render :show, status: :remember_created_at
    else
      render_error
    end

  end

  #PATCH /api/v1/robots/:id # authenticated
  def update
    if @robot.update(robot_params)
      render :show
    else
      render_error
    end
  end

  #DELETE /api/v1/robots/:id # authenticated
  def destroy
    @robot.destroy
    head :no_content
  end

  private

  def set_robot
    @robot = Robot.find(params[:id])
    authorize @robot #For Pundit
  end

  def robot_params
    params.require(:robot).permit(:name, :robot_type, :serial_number)
  end

  def render_error
    render json: { errors: @robot.errors.full_messages },
    status: :unprocessable_entity
  end

end