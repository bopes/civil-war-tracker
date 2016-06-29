Rails.application.routes.draw do

  resources :sides, only: [:index, :show, :new, :create]
  resources :players, only: [:index, :show, :new, :create]
  resources :armies, only: [:index, :show, :new, :create]
  resources :campaigns, only: [:index, :show, :new, :create]
  resources :battles, only: [:indx, :show, :new, :create]
  resources :events, only: [:index, :show, :new, :create]

  root 'static_pages#home'

end
