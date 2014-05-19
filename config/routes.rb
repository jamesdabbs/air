Rails.application.routes.draw do
  devise_for :users

  root to: "cats#index"

  resources :cats, only: [:index] do
    post :serve, on: :collection
  end
end
