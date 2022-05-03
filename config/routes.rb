Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  root "resources#index"

  resources :resources
  resources :oauth_applications
  
  namespace :api do
    resources :resources, only: [:index]
  end
end
