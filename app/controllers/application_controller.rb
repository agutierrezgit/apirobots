class ApplicationController < ActionController::API
    
    #Devise helpers to set up controller with user authentication
    before_action :authenticate_user!
end
