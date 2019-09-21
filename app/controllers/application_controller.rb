class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :authenticate_user!
  
  # Include this to format the response to json
  respond_to :json
  
  #Include this module por rails-API
  include ActionController::RequestForgeryProtection
  protect_from_forgery unless: -> { request.format.json? }
  
  #Authorization System Pundit
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
