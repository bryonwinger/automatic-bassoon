Rails.application.routes.draw do
  resources :tossers
  resources :articles
  resources :circuits
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
