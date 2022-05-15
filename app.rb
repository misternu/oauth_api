require 'sinatra'
require 'sinatra/flash'
require 'oauth2'
require 'json'
require 'dotenv/load'
enable :sessions

def client
  client_id = ENV['APP_CLIENT_ID']
  client_secret = ENV['APP_CLIENT_SECRET']
  OAuth2::Client.new(client_id, client_secret, site: "http://localhost:3000")
end

get "/auth/test" do
  redirect client.auth_code.authorize_url(redirect_uri: redirect_uri)
end

get '/auth/test/callback' do
  access_token = client.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
  session[:access_token] = access_token.token
  flash[:message] = "Successfully authenticated with the server"
  redirect '/'
end
 
get '/' do
  if session[:access_token]
    @resources = get_response('v1/resources')
  else
    flash.now[:message] = 'You need an access token'
  end
  erb :index
end

def get_response(url)
  access_token = OAuth2::AccessToken.new(client, session[:access_token])
  p access_token
  JSON.parse(access_token.get("/api/#{url}").body)
end

def redirect_uri
  uri = URI.parse(request.url)
  uri.path = '/auth/test/callback'
  uri.query = nil
  uri.to_s
end
