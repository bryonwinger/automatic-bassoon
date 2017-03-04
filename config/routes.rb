Rails.application.routes.draw do
  root "pages#index"
  resources :articles
  resources :circuits

  resources :users do
    member do
      get 'favorite_circuits', to: 'users#favorite_circuits'
      post 'add_favorite_circuit', to: 'users#add_favorite_circuit'
      delete 'favorite_circuit', to: 'users#delete_favorite_circuit'
    end
  end

  resources :effect_types
end
