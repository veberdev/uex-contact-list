Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contacts do
        collection do
          get 'search', to: 'contacts#search', as: 'search_contacts'
        end
      end
      resources :accounts, only: [:index, :create, :destroy]
      resources :sessions, only: :create
      get 'addresses/:cep', to: 'addresses#search_by_cep'
    end
  end
end
