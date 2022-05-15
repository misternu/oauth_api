module V1
  class Resources < Grape::API
    include V1::Defaults

    desc 'Return all Resources'
    get do
      present current_user.resources
    end
  end
end
