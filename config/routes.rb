Rails.application.routes.draw do

  root 'static_pages#home'

  resources :sides, only: [:index, :show]
  resources :armies, only: [:index, :show]

end
