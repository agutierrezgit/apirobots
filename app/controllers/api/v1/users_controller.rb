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


  #POST /api/v1/users #authenticated
  def create
    @user = User.new(user_params)
      authorize @user
        
      if @user.save
        render :show, status: :created
      else
        render_error
      end
   end

  #PATCH /api/v1/users/:id # authenticated
  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  #DELETE /api/v1/users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation) 
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end
end