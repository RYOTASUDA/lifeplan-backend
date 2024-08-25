Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[index new create edit update]
end
