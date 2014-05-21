require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  mount Sidekiq::Web => "/sidekiq"

  root to: "cats#index"

  resources :cats, only: [:index] do
    post :serve, on: :collection
  end
end
