class Api::V1::WeaponsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:show ]  
  before_action :set_weapon, only: [ :show, :update, :destroy]
    
  #GET /api/v1/robots/:id/weapons/:id
  def show
    skip_authorization
  end

#   #POST /api/v1/robots/:id/weapons #authenticated
#   def create
    
#     @weapon = Weapon.new(weapon_params)
#     @weapon.user = current_user
#     if @weapon.save
#       render :show, status: :remember_created_at
#     else
#       render_error
#     end

#   end

#   #PATCH /api/v1/robots/:id/weapons/:id # authenticated
#   def update
#     if @weapon.update(weapon_params)
#       render :show
#     else
#       render_error
#     end
#   end

#   #DELETE /api/v1/robots/:id/weapons/:id # authenticated
#   def destroy
#     @weapon.destroy
#     head :no_content
#   end

#   private

  def set_weapon
    @weapon = Weapon.find(params[:id])
  end

#   def weapon_params
#     params.require(:weapon).permit(:name, :weapon_type, :serial_number)
#   end

#   def render_error
#     render json: { errors: @weapon.errors.full_messages },
#     status: :unprocessable_entity
#   end

end