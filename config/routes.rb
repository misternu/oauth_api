Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  root "dashboard#index"

  resources :resources
  
  namespace :api do
    resources :resources, only: [:index]
  end
end
