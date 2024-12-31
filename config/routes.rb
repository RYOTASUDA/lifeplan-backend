# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[index new create edit update]

  get '/auth/:provider/callback', to: 'api/sessions#google_oauth2_callback'

  namespace :api, defaults: { format: :json } do
    delete '/logout', to: 'sessions#destroy'

    resource :users, only: %i[show]
    resources :categories, only: %i[index create edit update destroy]
  end
end
