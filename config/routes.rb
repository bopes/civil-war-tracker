Rails.application.routes.draw do

  get 'engagements' => 'battles#index'

  resources :players
  resources :armies
  resources :campaigns
  resources :battles
  resources :events
  resources :locations
  resources :ranks, only: [:new, :create, :edit, :update, :destroy]

  root 'static_pages#home'

end
