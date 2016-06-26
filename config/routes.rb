Rails.application.routes.draw do


  resources :sides, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :armies, only: [:index, :show]
  resources :campaigns, only: [:index, :show]

  root 'static_pages#home'

end
