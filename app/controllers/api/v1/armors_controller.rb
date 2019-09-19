class Api::V1::ArmorsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:show ]  
  before_action :set_armor, only: [ :show, :update, :destroy]
    
  #GET /api/v1/robots/:id/armors/:id
  def show
  end

  #POST /api/v1/robots/:id/armors #authenticated
  
  def create
    @robot = Robot.find(params[:robot_id])
    @armor = Armor.new(armor_params)
    @armor.robot = @robot
    authorize @armor
    if @armor.save
      render :show, status: :created
    else
      render_error
    end

  end

  #PATCH /api/v1/robots/:id/armors/:id # authenticated
  def update
    if @armor.update(armor_params)
      render :show
    else
      render_error
    end
  end

  #DELETE /api/v1/robots/:id/armors/:id # authenticated
  def destroy
    @armor.destroy
    head :no_content
  end

  private

  def set_armor
    @armor = Armor.find(params[:id])
    authorize @armor # For pundit
  end

  def armor_params
    params.require(:armor).permit(:armor_type, :serial_number)
  end

  def render_error
    render json: { errors: @armor.errors.full_messages },
    status: :unprocessable_entity
  end

end