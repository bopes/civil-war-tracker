Rails.application.routes.draw do

  get 'engagements' => 'static_pages#engagements'

  resources :players
  resources :armies
  resources :campaigns
  resources :battles
  resources :events
  resources :locations
  resources :ranks, only: [:new, :create, :edit, :update, :destroy]

  root 'static_pages#home'

end
