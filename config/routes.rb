Rails.application.routes.draw do

  get 'engagements' => 'battles#index'

  resources :sides, only: [:index, :show, :new, :create]
  resources :players
  resources :armies
  resources :campaigns
  resources :battles, only: [:show, :new, :create]
  resources :events, only: [:index, :show, :new, :create]
  resources :locations

  root 'static_pages#home'

end
