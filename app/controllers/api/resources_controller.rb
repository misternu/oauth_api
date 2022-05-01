class Api::ResourcesController < ActionController::API
  before_action :doorkeeper_authorize!
  
  def index
    render json: Resource.all
  end
end
