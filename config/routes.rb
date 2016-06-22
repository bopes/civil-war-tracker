Rails.application.routes.draw do

  resources :sides, only: [:index, :show]

end
