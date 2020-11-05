# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
      resources :tools
    end
  end
end
