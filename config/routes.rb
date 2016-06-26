Rails.application.routes.draw do


  get 'battles/index'

  get 'battles/show'

  resources :sides, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :armies, only: [:index, :show]
  resources :campaigns, only: [:index, :show]
  resources :battles, only: [:indx, :show]

  root 'static_pages#home'

end
