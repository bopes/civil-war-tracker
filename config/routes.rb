Rails.application.routes.draw do

  get 'engagements' => 'battles#index'

  resources :sides, only: [:index, :show, :new, :create]
  resources :players
  resources :armies
  resources :campaigns
  resources :battles
  resources :events, only: [:index, :show, :new, :create]
  resources :locations
  resources :ranks, only: [:new, :create, :edit, :update, :destroy]

  root 'static_pages#home'

end
