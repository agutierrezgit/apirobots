class Api::V1::SessionsController < Api::V1::BaseController
    
    def create
       @user = User.find_by_email(params[:email]) 
       skip_authorization

       if @user && @user.valid_password?(params[:password])
            render :show
        else
            render_error
        end
    end

    def destroy
   
    end

    private

    def render_error
        render json: { errors: { 'email or password' => ['is invalid'] } },
        status: :unprocessable_entity
    end
end