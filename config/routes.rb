Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "users#index"

  get '/list' => 'users#list'
  get '/u' => 'users#show'
  post '/sessions' => 'sessions#create'

  resources :users
end
