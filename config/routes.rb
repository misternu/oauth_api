Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  root "resources#index"

  resources :resources
  resources :oauth_applications
  
  mount V1::Resources, at: "/api/v1/resources"
end
