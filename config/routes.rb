Rails.application.routes.draw do
  root "pages#index"
  resources :articles
  resources :circuits
  resources :users
  resources :effect_types
end
