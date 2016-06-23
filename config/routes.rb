Rails.application.routes.draw do

  root 'static_pages#home'

  resources :sides, only: [:index, :show] do
    member do
      resources :players, only: [:index, :show]
      resources :armies, only: [:index, :show] do
        member do
          resources :campaigns, only: [:index, :show]
        end
      end
    end
  end

end
