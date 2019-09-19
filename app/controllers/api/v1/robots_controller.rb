class Api::V1::RobotsController < Api::V1::BaseController
  
  #GET /api/v1/robots  #unauthenticated
  def index
    @restaurants = policy_scope(Restaurant)
  end
  
end