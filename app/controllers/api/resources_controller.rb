class Api::ResourcesController < ActionController::API
  before_action :doorkeeper_authorize!
  
  def index
    render json: current_resource_owner.resources
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
