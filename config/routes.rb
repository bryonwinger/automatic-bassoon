Rails.application.routes.draw do
  root "pages#index"
  resources :articles
  resources :circuits

  resources :users do
    member do
      post 'add_favorite_circuit', to: 'users#add_favorite_circuit'
    end
  end

  resources :effect_types
end
