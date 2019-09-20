class Api::V1::SessionsController < Api::V1::BaseController

    def create
       @user = User.find_by_email(params[:email]) 
       skip_authorization

       if @user && @user.valid_password?(params[:password])
            render json: @user.as_json(only: :email), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy

    end

end