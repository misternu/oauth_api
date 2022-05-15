require 'doorkeeper/grape/helpers'

module V1
  module Defaults
    extend ActiveSupport::Concern

    included do
      helpers Doorkeeper::Grape::Helpers
      format :json

      before do
        doorkeeper_authorize!
      end

      helpers do
        def current_user
          @user ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end
    end
  end
end
