class ResourcesController < ApplicationController
  before_action :authenticate_user!

  def index
    @resources = current_user.resources
  end

  def create
    current_user.resources.create
    redirect_to resources_path
  end
end
