class OauthApplicationsController < ApplicationController
  def index
    @oauth_applications = current_user.oauth_applications
    @application = Doorkeeper::Application.new
  end

  def create
    @application = current_user.oauth_applications.new(application_params)
    if @application.save
      redirect_to '/oauth_applications'
    else
      @oauth_applications = current_user.oauth_applications
      render :index
    end
  end

  private

  def set_application
    @application = current_user.oauth_applications.find(params[:id])
  end

  def application_params
    params.require(:doorkeeper_application).permit(:name, :redirect_uri, :scopes, :confidential)
  end
end
