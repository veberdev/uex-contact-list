Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contacts
      resources :accounts, only: [:index, :create, :destroy]
      resources :sessions, only: :create
      get 'addresses/:cep', to: 'addresses#search_by_cep'
    end
  end
end
