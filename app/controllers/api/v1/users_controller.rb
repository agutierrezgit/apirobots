class Api::V1::UsersController < Api::V1::BaseController
    
  #GET /api/v1/users/1
  def show
    @user = User.find_by_email(params[:email]) 
    skip_authorization

    if @user && @user.valid_password?(params[:password])
       render :show
    else
            render_error
    end
  end

  private

  def render_error
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end
end