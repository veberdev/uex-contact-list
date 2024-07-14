Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contacts
      resources :accounts, only: [:index, :create, :destroy]
      resources :sessions, only: :create
    end
  end
end
