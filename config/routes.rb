Rails.application.routes.draw do
  root "pages#index"
  resources :articles
  resources :circuits

  resources :users, param: :username do
    member do
      get 'circuits', to: 'users#circuits_index'
      get 'favorite_circuits', to: 'users#favorite_circuits_index'
      post 'add_favorite_circuit', to: 'users#add_favorite_circuit'
      delete 'favorite_circuit', to: 'users#delete_favorite_circuit'
    end
  end

  resources :effect_types
end
