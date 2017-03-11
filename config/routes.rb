Rails.application.routes.draw do
  root to: 'messages#index'

  resources :users
  resources :messages
end
