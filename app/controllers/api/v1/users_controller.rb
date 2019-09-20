class Api::V1::UsersController < Api::V1::BaseController
    
    #POST /api/v1/users
    def show
       @user = User.find_by_email(params[:email]) 
       skip_authorization

       if @user && @user.valid_password?(params[:password])
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

    def render_error
        render json: { errors: { 'email or password' => ['is invalid'] } },
        status: :unprocessable_entity
    end
end