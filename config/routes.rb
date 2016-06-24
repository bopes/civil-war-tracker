Rails.application.routes.draw do

  get 'battles/index'

  get 'battles/show'

  root 'static_pages#home'

  resources :sides, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :armies, only: [:index, :show]
  resources :campaigns, only: [:index, :show]

end
