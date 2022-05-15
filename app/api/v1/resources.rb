module V1
  class Resources < Grape::API
    include V1::Defaults

    desc 'Return all Resources'
    get do
      present current_user.resources
    end

    desc 'Delete a Resource'
    params do
      requires :id, type: String, desc: 'Resource ID'
    end
    delete ':id' do
      current_user.resources.find(params[:id]).destroy
    end
  end
end
