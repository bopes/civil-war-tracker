Rails.application.routes.draw do

  resources :sides, only: [:index, :show, :new, :create]
  resources :players, only: [:index, :show, :new, :create]
  resources :armies
  resources :campaigns, only: [:index, :show, :new, :create]
  resources :battles, only: [:indx, :show, :new, :create]
  resources :events, only: [:index, :show, :new, :create]
  resources :locations

  root 'static_pages#home'

end
