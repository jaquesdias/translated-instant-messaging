Rails.application.routes.draw do
  root to: 'messages#index'

  resources :users
  resources :messages

  get '/active_users', to: "users#active_users", as: :active_users
end
