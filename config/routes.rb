Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :webhooks, only: :none do
    collection do
      get :helpscout
    end
  end
end
