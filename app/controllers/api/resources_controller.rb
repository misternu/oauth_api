class Api::ResourcesController < ActionController::API
  def index
    render json: Resource.all
  end
end
